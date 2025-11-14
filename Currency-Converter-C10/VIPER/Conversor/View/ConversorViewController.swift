//
//  ConversorViewController.swift
//  Currency-Converter-C10
//
//  Created by Wise on 12/11/25.
//

import UIKit

final class ConversorViewController: UIViewController{
    

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("Use init() instead, this VC is programmatic only.")
        }
    

    
    // variavel temporária para permitir comunicação entre as camadas
    // É nela que o valor convertido chega depois de passar por todas as camadas do app
    var ValorConvertido: Double?
    var moedasV: [Moeda] = []
    var presenter: ViewToPresenter?
    
    let conversorView = ConversorView()
    
    override func loadView() {
        view = conversorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        bindings()
        delegates()
        self.title = "Conversor de Moedas"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func bindings() {
        conversorView.converterB.addTarget(self, action: #selector(converterFunc), for: .touchUpInside)
        conversorView.historico.addTarget(self, action: #selector(goToHistorico), for: .touchUpInside)
        
    }
    
    @objc private func goToHistorico() {
        presenter?.BotaoHistoricoPressionado()
    }
    @objc private func converterFunc() {
        // Extrai o valor digitado e chama o presenter com os rótulos corretos
        let texto = conversorView.moedaOrige.text ?? ""
        guard let valor = Double(texto.replacingOccurrences(of: ",", with: ".")) else {
            // TODO: exibir feedback ao usuário sobre valor inválido
            return
        }
        guard let moeda = (conversorView as ConversorView).moedaSelecionada else { return }
        presenter?.BotaoConversaoPressionado(valor: valor, moeda: moeda)
    }
    
    private func delegates(){
        conversorView.moedaOrige.delegate = self
    }
    
    
    func updateDropdown() {
        let actions = moedasV.map { moeda in
            UIAction(title: moeda.nome) { _ in
                self.conversorView.moedaSelecionada = moeda
                self.conversorView.moedaPicker.setTitle(moeda.nome, for: .normal)
            }
        }

        conversorView.moedaPicker.menu = UIMenu(children: actions)
        conversorView.moedaPicker.showsMenuAsPrimaryAction = true
    }

    
}




// É através dessa extensão que essa classe se conforma ao presenter.view. Pois ela é do tipo PresenterToView. No caso, é de onde o dado chega da presenter.

extension ConversorViewController: PresenterToView {
    
    // Aqui a view estaria armazenando em Valor convertido o valor que veio da presenter, que veio do interactor
    func mostrarValorConvertido(_ valor: Double) {
        conversorView.moedaFinal.text = String(valor)
    }
    
    func pegarMoedas(_ moedas: [Moeda]) {
        moedasV = moedas
        updateDropdown()
    }
}

extension ConversorViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}



