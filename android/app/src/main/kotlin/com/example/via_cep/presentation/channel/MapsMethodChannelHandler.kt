package com.example.via_cep.presentation.channel

import com.example.via_cep.domain.model.Address
import com.example.via_cep.domain.usecase.OpenGoogleMapsUseCase
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MapsMethodChannelHandler(
    private val openGoogleMapsUseCase: OpenGoogleMapsUseCase
) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "abrirMapsNativo") { // Mantido igual ao contrato do Dart MethodChannel
            val args = call.arguments as? Map<String, Any>
            
            if (args != null) {
                // De-serialização do payload do Flutter mapeando para o modelo em inglês
                val address = Address(
                    street = args["logradouro"] as? String ?: "",
                    number = args["numero"] as? String ?: "",
                    neighborhood = args["bairro"] as? String ?: "",
                    city = args["localidade"] as? String ?: "",
                    state = args["uf"] as? String ?: ""
                )

                val useCaseResult = openGoogleMapsUseCase.execute(address)
                
                useCaseResult.fold(
                    onSuccess = { result.success(it) },
                    onFailure = { result.error("UNAVAILABLE", "Google Maps is not available.", null) }
                )
            } else {
                result.error("INVALID_ARGUMENTS", "Invalid data payload.", null)
            }
        } else {
            result.notImplemented()
        }
    }
}