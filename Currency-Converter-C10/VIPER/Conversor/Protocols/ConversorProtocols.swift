//
//  Protocols.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//


protocol ConversorViewProtocol: AnyObject {
    
}

protocol ConversorPresenter: AnyObject {
    func viewDidLoad()
}

protocol ConversorInteractor: AnyObject {
    
}

protocol ConversorRouter: AnyObject {
    
}

protocol Conversao {
    var moedaOrigem: Moeda { get }
    
    func converterParaReal(v: Double) -> Double
}
