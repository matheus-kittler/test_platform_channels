# ViaCEP Search & Native Maps Integration

A production-ready Flutter application designed to implement **Clean Architecture**, state-of-the-art state management, and robust native interoperability using **Platform Channels**. 

The main purpose of this project is to showcase standard market frameworks for enterprise-level Flutter apps and demonstrate how to channel data seamlessly from the Dart layer down to native **Android (Kotlin)** to trigger system intents.

---

## 🚀 Key Features

* **CEP Postal Code Lookup:** Consumes the ViaCEP API reactively.
* **Multi-Screen Navigation:** Uses declarative routing to pass domain entities across screens.
* **Dynamic Property Number Input:** A dedicated details screen to input specific property locations.
* **Native Android Intent Linkage:** Transfers address payloads via platform channels to spin up the official Google Maps native app precisely centered on the input address.

---

## 🏗️ Architecture & Project Structure

The project strictly adheres to **Clean Architecture** principles, enforcing a clear separation of concerns across layers:

* **Data:** Implements data transfer objects (DTOs), API code generation (`Retrofit`), and data source implementations.
* **Domain:** Houses pure business logic, abstract repository contracts, and UseCases. Completely isolated from external frameworks.
* **Presentation:** Manages UI states and tracking using a modern reactive approach (`Riverpod`).

---

## 🛠️ Tech Stack & Frameworks

This project leverages the exact ecosystem demanded by major tech companies in the mobile industry:

* **State Management & DI:** `Flutter_Riverpod` (with automated Provider Generation)
* **Navigation:** `GoRouter` (Declarative routing with type-safe arguments)
* **Networking:** `Dio` + `Retrofit` (For compile-time type-safe REST API clients)
* **Data Modeling:** `Freezed` + `JsonSerializable` (Immutable data classes and union types)
* **Native Interop:** `MethodChannel` (**Platform Channels**) communicating directly with a native Kotlin `MainActivity`.

---

## 🔌 How the Platform Channel Works

To open the Google Maps app natively without third-party web views, the app establishes a `MethodChannel` bridge named `br.com.matheuskittler.via_cep/maps`.

1. **Dart Side (`Presentation Layer`):** Compiles the address fields (`logradouro`, `bairro`, `localidade`, `uf`) along with the user-defined property number into a map payload and invokes `abrirMapsNativo`.
2. **Kotlin Side (`MainActivity.kt`):** Intercepts the invocation, extracts the arguments, safely formats a geographical query URI (`geo:0,0?q=...`), and fires an Android `ACTION_VIEW` system Intent targeting the official Google Maps package (`com.google.android.apps.maps`).

---

## ⚙️ Getting Started

### Prerequisites
* Flutter SDK (3.x or higher)
* Android Studio & Android SDK 34 Installed
* An active Android Emulator or physical device

### Running the App
1. Clone the repository:
   ```bash
   git clone [https://github.com/matheus-kittler/test_platform_channels.git](https://github.com/matheus-kittler/test_platform_channels.git)
