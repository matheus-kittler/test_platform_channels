import Foundation

struct AddressSave: Identifiable {
    let id = UUID()
    let logradouro: String
    let numero: String
    let bairro: String
    let localidade: String
    let uf: String
    
    var fullAddress: String {
        return "\(logradouro), \(numero) - \(bairro), \(localidade) - \(uf)"
    }
}