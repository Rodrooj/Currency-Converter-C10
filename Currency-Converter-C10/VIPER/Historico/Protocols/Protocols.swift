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
    func mostrarRegistroFormatado(_ dado: Registro)// Na view, você chama uma extensão desse tipo, cria a função e guarda os registros formatados da melhor forma
}

protocol HistoricoModulos {
    func criarNavegacaoHistorico() -> UIViewController
    
}
