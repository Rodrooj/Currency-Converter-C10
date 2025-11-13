//
//  HistoricoEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

struct Registro: Codable {
    var moedaOrigem: [Moeda]
    var moedaDestino: [Moeda]
    var valorConvertido: Double
    var dataConversao: String
}
