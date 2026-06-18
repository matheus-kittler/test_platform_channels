import Foundation
import Combine

@available(iOS 14.0, *)
class AddressListViewModel: ObservableObject {
    @Published var addresses: [AddressSave] = []
    
    private let repository: AddressRepository
    private let openAppleMapsUseCase: OpenAppleMapsUseCase
    private let openGoogleMapsUseCase: OpenGoogleMapsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    // Injeção de Dependências via Construtor
    init(
        repository: AddressRepository = .shared,
        openAppleMapsUseCase: OpenAppleMapsUseCase = OpenAppleMapsUseCase(),
        openGoogleMapsUseCase: OpenGoogleMapsUseCase = OpenGoogleMapsUseCase()
    ) {
        self.repository = repository
        self.openAppleMapsUseCase = openAppleMapsUseCase
        self.openGoogleMapsUseCase = openGoogleMapsUseCase
        
        // Observa mudanças no repositório de dados de forma reativa
        repository.$list
            .assign(to: \.addresses, on: self)
            .store(in: &cancellables)
    }
    
    func openAppleMaps(para address: AddressSave) {
        openAppleMapsUseCase.execute(for: address)
    }
    
    func openGoogleMaps(para address: AddressSave) {
        openGoogleMapsUseCase.execute(for: address)
    }
}