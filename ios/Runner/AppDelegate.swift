import UIKit
import Flutter
import SwiftUI

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let registerAddress = self.registerAddress(forPlugin: "ViaCepMapsPlugin")
    let mapsChannel = FlutterMethodChannel(name: "br.com.matheuskittler.via_cep/maps",
                                           binaryMessenger: registerAddress!.messenger())
    
    mapsChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard let self = self else { return }
        
      if call.method == "openMapsNativo" {
          // Lógica simplificada de redirecionamento direto
          result(true)
          
      if call.method == "save and open maps" {
        guard let args = call.arguments as? [String: Any] else {
          result(FlutterError(code: "INVALID_ARGUMENTS", message: "Payload inválido", details: nil))
          return
        }
        
        let newAddress = AddressSave(
            logradouro: args["logradouro"] as? String ?? "",
            numero: args["numero"] as? String ?? "",
            bairro: args["bairro"] as? String ?? "",
            localidade: args["localidade"] as? String ?? "",
            uf: args["uf"] as? String ?? ""
        )
        
        if #available(iOS 14.0, *) {
            // Comunicação direta com a camada Data
            AddressRepository.shared.salvar(endereco: newAddress)
            
            let swiftUIView = NativeAddressListView()
            let hostingController = UIHostingController(rootView: swiftUIView)
            hostingController.modalPresentationStyle = .pageSheet
            
            if let keyWindow = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .flatMap({ $0.windows })
                .first(where: { $0.isKeyWindow }),
               let rootViewController = keyWindow.rootViewController {
                rootViewController.present(hostingController, animated: true, completion: nil)
                result(true)
            } else {
                result(FlutterError(code: "UI_ERROR", message: "Window ativa não encontrada", details: nil))
            }
        } else {
            result(FlutterError(code: "DEVICE_OS_LEGACY", message: "Requer iOS 14+", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}