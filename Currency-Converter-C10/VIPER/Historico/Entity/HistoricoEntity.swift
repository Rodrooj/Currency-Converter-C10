import Foundation

struct Registro: Codable {
    var valorOriginal: Double
    var moedaOriginal: String // Usar sigla (BRL, USD, EUR)
    var valorConvertido: Double
    var dataConversao: String
    
    // Computed property para formatação
    var textoFormatado: String {
        let simbolo: String
        switch moedaOriginal {
        case "EUR":
            simbolo = "€"
        case "USD":
            simbolo = "US$"
        case "BRL":
            simbolo = "R$"
        default:
            simbolo = moedaOriginal
        }
        
        return "\(simbolo)\(String(format: "%.2f", valorOriginal)) → R$\(String(format: "%.2f", valorConvertido))"
    }
}
