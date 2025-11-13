//
//  HistoricoInteractor.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

class HistoricoInteractor: PresenterToInteractorHistorico {
    var presenter: InteractorToPresenterHistorico?
    
    func obterHistorico() {
        // Código que vai obter os dados da conversão e transformar em histórico
        presenter?.enviarDados(<#T##dado: Registro##Registro#>)
    }
}

