import Foundation

class HistoricoPresenter: ViewToPresenterHistorico {
    var view: PresenterToViewHistorico?
    var interactor: PresenterToInteractorHistorico?
    
    func viewDidLoad() {
        interactor?.obterHistorico()
    }
}

extension HistoricoPresenter: InteractorToPresenterHistorico {
    func enviarHistorico(_ registros: [Registro]) {
        view?.mostrarHistorico(registros)
    }
    
    // Método antigo mantido para compatibilidade
    func enviarDados(_ dado: Registro) {
        // Não mais utilizado
    }
}
