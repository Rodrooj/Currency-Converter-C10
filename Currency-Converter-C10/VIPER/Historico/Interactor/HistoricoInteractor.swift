//
//  HistoricoInteractor.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

class HistoricoInteractor: PresenterToInteractorHistorico {
    func obterHistorico(dado: Registro) {
        
    }
    
    var presenter: InteractorToPresenterHistorico?
    var registroAdapter: RegistroAdapter?
    
    func obterHistorico() {
        // Código que vai obter os dados da conversão e transformar em histórico
        guard let adapter = registroAdapter else { return }
        presenter?.enviarDados(adapter.adaptarRegistro())
    }
}

// MARK: Adapter
class RegistroAdapter: Conversao {
    var moedaOrigem: Moeda
    var valorInserido: Double?
    
    func converterParaReal(v: Double) -> Double {
        valorInserido = v
        return moedaOrigem.valorReal * v
    }
    
    func adaptarRegistro() -> Registro {
        guard let valor = valorInserido else { return Registro(valorOriginal: 0, moedaOriginal: "", valorConvertido: 0) }
        
        var registro = Registro(valorOriginal: valor, moedaOriginal: moedaOrigem.nome, valorConvertido: converterParaReal(v: valor))
        
        return registro

    }
    
    init(moedaOrigem: Moeda) {
        self.moedaOrigem = moedaOrigem
    }
}
