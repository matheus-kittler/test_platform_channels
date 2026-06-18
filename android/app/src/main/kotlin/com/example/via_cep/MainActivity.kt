package com.example.via_cep

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "br.com.matheuskittler.via_cep/maps"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "abrirMapsNativo") {
                val args = call.arguments as? Map<String, Any>
                
                if (args != null) {
                    val logradouro = args["logradouro"] as? String ?: ""
                    val numero = args["numero"] as? String ?: ""
                    val bairro = args["bairro"] as? String ?: ""
                    val localidade = args["localidade"] as? String ?: ""
                    val uf = args["uf"] as? String ?: ""

                    // Monta o endereço formatado para o Maps
                    val enderecoCompleto = "$logradouro, $numero - $bairro, $localidade - $uf"

                    // Cria a URI de busca textual
                    val gmmIntentUri = Uri.parse("geo:0,0?q=${Uri.encode(enderecoCompleto)}")

                    // Configura a Intent nativa do Android
                    val mapIntent = Intent(Intent.ACTION_VIEW, gmmIntentUri).apply {
                        setPackage("com.google.android.apps.maps")
                    }

                    try {
                        startActivity(mapIntent)
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("UNAVAILABLE", "O Google Maps não está disponível.", null)
                    }
                } else {
                    result.error("INVALID_ARGUMENTS", "Dados inválidos.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}