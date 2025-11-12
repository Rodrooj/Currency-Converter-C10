//
//  ConversorInteractor.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

// MARK: Factory
enum TipoMoeda {
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
        valorDolar *= conversorAntigo.dolar
        let resul = valorDolar * moedaOrigem.valorReal
        return resul
    }
    
}
