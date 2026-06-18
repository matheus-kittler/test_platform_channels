package com.example.via_cep.domain.model

data class Address(
    val street: String,
    val number: String,
    val neighborhood: String,
    val city: String,
    val state: String
) {
    val fullAddress: String
        get() = "$street, $number - $neighborhood, $city - $state"
}