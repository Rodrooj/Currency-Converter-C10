import UIKit

protocol ViewToPresenterHistorico: AnyObject {
    var view: PresenterToViewHistorico? { get set }
    var interactor: PresenterToInteractorHistorico? { get set }
    func viewDidLoad()
}

protocol PresenterToInteractorHistorico: AnyObject {
    var presenter: InteractorToPresenterHistorico? { get set }
    func obterHistorico()
    func obterHistorico(dado: Registro) // Mantido para compatibilidade
}

protocol InteractorToPresenterHistorico: AnyObject {
    func enviarHistorico(_ registros: [Registro])
    func enviarDados(_ dado: Registro) // Mantido para compatibilidade
}

protocol PresenterToViewHistorico: AnyObject {
    var presenter: ViewToPresenterHistorico? { get set }
    func mostrarHistorico(_ registros: [Registro])
    func mostrarRegistroFormatado(_ dados: String) // Mantido para compatibilidade
}

protocol HistoricoModulos: AnyObject {
    func criarNavegacaoHistorico() -> UIViewController
}
