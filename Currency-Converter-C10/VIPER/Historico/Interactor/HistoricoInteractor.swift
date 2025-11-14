import Foundation

class HistoricoInteractor: PresenterToInteractorHistorico {
    weak var presenter: InteractorToPresenterHistorico?
    
    func obterHistorico() {
        let registros = HistoricoManager.shared.registros
        presenter?.enviarHistorico(registros)
    }
    
    func obterHistorico(dado: Registro) {
        // Mantido para conformidade com o protocolo, mas não é mais necessário
    }
}
