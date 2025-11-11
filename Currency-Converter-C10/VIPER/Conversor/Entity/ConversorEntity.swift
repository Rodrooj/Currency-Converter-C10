//
//  ConversorEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

struct moeda: Codable {
    var nome: String
    var pais: [String]
    var valorReal: Double
    var sigla: String
}
