//
//  HistoricoEntity.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

struct Registro: Codable {
    let valorOriginal: Double
    let moedaOriginal: Moeda
    let valorConvertido: Double
    // Arranjar uma forma de guardar a data da conversão aqui
}
