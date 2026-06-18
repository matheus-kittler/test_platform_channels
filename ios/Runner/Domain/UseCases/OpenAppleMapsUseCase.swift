import UIKit

class OpenAppleMapsUseCase {
    func execute(for address: AddressSave) {
        guard let encodedAddress = address.fullAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "maps://?q=\(encodedAddress)") else { return }
        UIApplication.shared.open(url)
    }
}