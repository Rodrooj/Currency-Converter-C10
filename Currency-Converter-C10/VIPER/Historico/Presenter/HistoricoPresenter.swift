//
//  HistoricoPresenter.swift
//  Currency-Converter-C10
//
//  Created by Wise on 11/11/25.
//

class HistoricoPresenter: ViewToPresenterHistorico {
    func viewDidLoad() {
        
    }
    
    var view: PresenterToViewHistorico?
    var interactor: PresenterToInteractorHistorico?
    // Futuro Router
}

extension HistoricoPresenter: InteractorToPresenterHistorico {
    func enviarDados(_ dado: Registro) {
        var moedaOriginalFormatada = "$"
        
        switch dado.moedaOriginal {
        case "euro":
            moedaOriginalFormatada = "€"
            break
        case "dolar":
            moedaOriginalFormatada = "US$"
            break
        default:
            print("Moeda não encontrada")
        }
        
        // Conversão de US$30: R$150
        var textoFormatado = "Conversão de \(moedaOriginalFormatada)\(dado.valorOriginal): R$\(dado.valorConvertido)"
    
        view?.mostrarRegistroFormatado(textoFormatado)
    }
}
