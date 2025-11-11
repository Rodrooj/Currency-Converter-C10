//
//  HistoricoEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

struct registro: Codable {
    var moedaOrigem: [moeda]
    var moedaDestino: [moeda]
    var valorConvertido: Double
    var dataConversao: String
}
