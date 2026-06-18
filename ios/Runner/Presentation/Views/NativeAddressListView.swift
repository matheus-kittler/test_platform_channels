import SwiftUI

@available(iOS 14.0, *)
struct NativeAddressListView: View {
    @StateObject private var viewModel = AddressListViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List(viewModel.addresses) { address in
                AddressRowView(address: address, viewModel: viewModel)
            }
            .navigationTitle("Endereços Salvos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Fechar") { dismiss() }
                }
            }
        }
    }
}