//
//  HistoricoPresenter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

class HistoricoPresenter: ViewToPresenterHistorico {
    var view: PresenterToViewHistorico?
    var interactor: PresenterToInteractorHistorico?
    // Futuro Router
}

extension HistoricoPresenter: InteractorToPresenterHistorico {
    func enviarDados(_ dado: Registro) {
        
        
        view?.mostrarRegistroFormatado(<#T##dado: Registro##Registro#>)
    }
}
