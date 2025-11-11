//
//  Protocols.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//


protocol ConversorView: AnyObject {
    
}

protocol ConversorPresenter: AnyObject {
    
}

protocol ConversorInteractor: AnyObject {
    
}

protocol ConversorRouter: AnyObject {
    
}

protocol Conversao {
    var moedaOrigem: Moeda { get }
    
    func converterParaReal(v: Double) -> Double
}
