import UIKit

// Protocolo opcional para deleção, a ser adotado pelo presenter
protocol HistoricoPresenterDelecao {
    func deletarRegistro(at index: Int)
}

class HistoricoView: UIViewController {
    var presenter: ViewToPresenterHistorico?
    
    // CORREÇÃO: Array para armazenar os registros
    private var registros: [Registro] = []
    
    @IBOutlet weak var historicoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Histórico"
        
        // Configurar table view
        historicoTable.dataSource = self
        historicoTable.delegate = self
        
        // CORREÇÃO: Chamar o presenter para carregar dados
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Recarregar dados sempre que a tela aparecer
        presenter?.viewDidLoad()
    }
}

extension HistoricoView: PresenterToViewHistorico {
    // CORREÇÃO: Implementar o método correto
    func mostrarHistorico(_ registros: [Registro]) {
        self.registros = registros
        historicoTable.reloadData()
        
        if registros.isEmpty {
            print("Nenhum registro no histórico")
        } else {
            print("Mostrando \(registros.count) registros")
        }
    }
    
    // Método antigo mantido para compatibilidade
    func mostrarRegistroFormatado(_ dados: String) {
        // Não mais utilizado
    }
}

extension HistoricoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // CORREÇÃO: Retornar o número real de registros
        return registros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historicoCell", for: indexPath)
        
        // CORREÇÃO: Mostrar dados reais
        let registro = registros[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = registro.textoFormatado
        content.secondaryText = registro.dataConversao
        cell.contentConfiguration = content
        
        return cell
    }
}

extension HistoricoView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Opcional: Permitir deletar registros
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Solicitar ao presenter que exclua o registro e recarregue a lista
            if let presenter = presenter as? HistoricoPresenterDelecao {
                presenter.deletarRegistro(at: indexPath.row)
            } else {
                // Fallback: solicitar recarga caso o presenter não suporte deleção direta
                presenter?.viewDidLoad()
            }
        }
    }
}
