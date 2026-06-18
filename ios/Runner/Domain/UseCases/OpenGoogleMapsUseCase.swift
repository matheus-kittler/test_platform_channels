import UIKit

class OpenGoogleMapsUseCase {
    func execute(for address: AddressSave) {
        guard let encodedAddress = address.fullAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let appUrl = URL(string: "comgooglemaps://?q=\(encodedAddress)")!
        let webUrl = URL(string: "http://maps.google.com/?q=\(encodedAddress)")!
        
        if UIApplication.shared.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl)
        } else {
            UIApplication.shared.open(webUrl)
        }
    }
}