import Foundation

// MARK: - Singleton para gerenciar histórico
class HistoricoManager {
    static let shared = HistoricoManager()
    private(set) var registros: [Registro] = []
    
    private init() {}
    
    func adicionarRegistro(_ registro: Registro) {
        registros.insert(registro, at: 0) // Adiciona no início
        print("Registro adicionado: \(registro)")
    }
    
    func limparHistorico() {
        registros.removeAll()
    }
}

// MARK: - Factory
class API {
    static func criarMoeda(type: TipoMoeda) -> Moeda {
        switch type {
        case .real:
            return Moeda(nome: "Real", paises: ["Brasil"], valorReal: 1.0, sigla: "BRL")
        case .dolar:
            return Moeda(nome: "Dólar", paises: ["United States"], valorReal: 5.0, sigla: "USD")
        case .euro:
            return Moeda(nome: "Euro", paises: ["Italy", "Spain"], valorReal: 6.0, sigla: "EUR")
        }
    }
}

// MARK: - Adapter
class ConversorAntigo {
    var real: Double
    var dolar: Double
    
    init(real: Double = 1, dolar: Double = 5) {
        self.real = real
        self.dolar = dolar
    }
    
    func converterRealParaDolar(v: Double) -> Double {
        return v / dolar
    }
}

class ConversorAdapter: Conversao {
    let conversorAntigo: ConversorAntigo
    var moedaOrigem: Moeda
        
    init(conversorAntigo: ConversorAntigo, moedaOrigem: Moeda) {
        self.conversorAntigo = conversorAntigo
        self.moedaOrigem = moedaOrigem
    }
    
    func converterParaReal(v: Double) -> Double {
        let valorDolar = conversorAntigo.converterRealParaDolar(v: v)
        let valorEmReais = valorDolar * conversorAntigo.dolar
        return valorEmReais * moedaOrigem.valorReal
    }
}

// MARK: - Classe ConversorInteractor
class ConversorInteractor: PresenterToInteractor {
    weak var presenter: InteractorToPresenter?
    
    func callAPI(completion: @escaping ([Moeda]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let moedas = TipoMoeda.allCases.map { API.criarMoeda(type: $0) }
            completion(moedas)
            print("Moedas recebidas:", moedas)
        }
    }
    
    func PedirConversao(valor: Double, moeda: Moeda) {
        let conversorAntigo = ConversorAntigo()
        let conversorAdaptado = ConversorAdapter(conversorAntigo: conversorAntigo, moedaOrigem: moeda)
        
        let valorConvertidoParaReais = conversorAdaptado.converterParaReal(v: valor)
        
        // CORREÇÃO: Salvar no histórico
        let dataAtual = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        let registro = Registro(
            valorOriginal: valor,
            moedaOriginal: moeda.sigla,
            valorConvertido: valorConvertidoParaReais,
            dataConversao: dataAtual
        )
        HistoricoManager.shared.adicionarRegistro(registro)
        
        presenter?.enviarValorConvertido(valor: valorConvertidoParaReais)
    }
}
