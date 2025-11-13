//
//  ConversorEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

struct Moeda: Codable {
    var nome: String
    var paises: [String]
    var valorReal: Double
    var sigla: String
}

enum TipoMoeda: Codable, CaseIterable {
    case real
    case dolar
    case euro
}
