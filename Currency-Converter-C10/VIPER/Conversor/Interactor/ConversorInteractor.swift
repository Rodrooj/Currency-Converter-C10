//
//  ConversorInteractor.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

// MARK: Factory
enum TipoMoeda: Codable {
    case real
    case dolar
    case euro
}

class API {
    func criarMoeda(type: TipoMoeda) -> Moeda {
        switch type {
        case .real:
            return Moeda(nome: "real", paises: ["Brasil"], valorReal: 1.0, sigla: "BRL")
        case .dolar:
            return Moeda(nome: "dolar", paises: ["United States"], valorReal: 5.0, sigla: "USD")
        case .euro:
            return Moeda(nome: "euro", paises: ["Italy, Spain"], valorReal: 6.0, sigla: "EUR")
        }
    }
}

// MARK: Adapter
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
        var valorDolar = conversorAntigo.converterRealParaDolar(v: v)
        
        //fiz alterações pra facilitar meu entendimento na hora de passar as coisas pra frente
        var valorEmReais = valorDolar * conversorAntigo.dolar
        return valorEmReais * moedaOrigem.valorReal
    }
    
}

// MARK: Classe ConversorInteractor

class ConversorInteractor: PresenterToInteractor {
    // Regra para a comunicação com camadas
    weak var presenter: InteractorToPresenter?
    
    // Conformidade com o protocolo
    var valorInserido: Double?
    var MoedaEscolhida: Moeda?
    
    
    func PedirConversao(valor: Double, moeda: Moeda){
        
        self.valorInserido = valor
        self.MoedaEscolhida = moeda
        
        let conversorAntigo = ConversorAntigo()
        let conversorAdaptado = ConversorAdapter(conversorAntigo: conversorAntigo, moedaOrigem: moeda)
        
        var valorConvertidoParaReais = conversorAdaptado.converterParaReal(v: valor)
        
        // Ele pega o valor que será convertido aqui nessa classe e passa para o presenter através da função enviarValorConvertido.
        presenter?.enviarValorConvertido(valor: valorConvertidoParaReais)
    }
    

}

