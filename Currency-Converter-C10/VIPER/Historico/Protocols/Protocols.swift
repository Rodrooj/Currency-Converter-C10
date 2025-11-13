//
//  Protocols.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

protocol ViewToPresenterHistorico: AnyObject {
    var view: PresenterToViewHistorico? { get set }
    var interactor: PresenterToInteractorHistorico? { get set }
    func viewDidLoad()
    // posteriormente fazer o router
    
    // aqui vão as funções que o presenter pode pedir para o interactor. Como nós não decidimos nada, não coloquei nada aqui.
     
}

protocol PresenterToInteractorHistorico {
    var presenter: InteractorToPresenterHistorico? { get set }
    
    func obterHistorico(dado: Registro)
}

protocol InteractorToPresenterHistorico {
    func enviarDados(_ dado: Registro) // Você já envia o pacote completo desde o interactor, chamando no presenter.
}

protocol PresenterToViewHistorico {
    func mostrarRegistroFormatado(_ dados: String)
    var presenter: ViewToPresenterHistorico? { get set }
    
    
}

protocol HistoricoModulos {
    func criarNavegacaoHistorico() -> UIViewController
    
}
