import Foundation

@available(iOS 14.0, *)
class AddressRepository: ObservableObject {
    static let shared = AddressRepository()
    
    @Published var list: [AddressSave] = []
    
    private init() {} // Garante o padrão Singleton real
    
    func save(address: AddressSave) {
        list.append(address)
    }
}