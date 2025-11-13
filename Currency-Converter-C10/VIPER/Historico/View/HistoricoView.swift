//
//  HistoricoView.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

import UIKit

class HistoricoView: UIViewController {
    var presenter: ViewToPresenterHistorico?
    
    
    
    @IBOutlet weak var historicoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension HistoricoView: PresenterToViewHistorico {
    func mostrarRegistroFormatado(_ dados: String) {
        
    }
}

extension HistoricoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historicoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "teste" //Aqui seria passado a array com os registros
        cell.contentConfiguration = content
        return cell
    }
    
}
    

