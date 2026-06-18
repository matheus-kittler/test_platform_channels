import SwiftUI

@available(iOS 14.0, *)
struct AddressRowView: View {
    let address: AddressSave
    let viewModel: AddressListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(address.logradouro), \(address.numero)")
                .font(.headline)
            
            Text("\(address.bairro) - \(address.localidade)/\(address.uf)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack(spacing: 12) {
                Button(action: { viewModel.openAppleMaps(para: address) }) {
                    Label("Apple Maps", systemImage: "map.fill")
                        .font(.caption)
                }
                
                Button(action: { viewModel.openGoogleMaps(para: address) }) {
                    Label("Google Maps", systemImage: "safari.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
            }
            .padding(.top, 4)
        }
        .padding(.vertical, 4)
    }
}