//
//  HistoricoEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import Foundation

struct Registro: Codable {
    var valorOriginal: Double
    var moedaOriginal: String
    var valorConvertido: Double
    var dataConversao: String //Pode ser um date tbm caso melhore na hora de mostrar
    // Arranjar uma forma de guardar a data da conversão aqui
}
