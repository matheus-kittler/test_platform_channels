package com.example.via_cep.domain.usecase

import android.content.Context
import android.content.Intent
import android.net.Uri
import com.example.via_cep.domain.model.Address

class OpenGoogleMapsUseCase(private val context: Context) {
    
    fun execute(address: Address): Result<Boolean> {
        return try {
            val gmmIntentUri = Uri.parse("geo:0,0?q=${Uri.encode(address.fullAddress)}")
            
            val mapIntent = Intent(Intent.ACTION_VIEW, gmmIntentUri).apply {
                setPackage("com.google.android.apps.maps")
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) 
            }
            
            context.startActivity(mapIntent)
            Result.success(true)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}