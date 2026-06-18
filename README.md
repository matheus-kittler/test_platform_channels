# Feature: Native Maps Integration Refactoring

This branch introduces a complete architecture overhaul for the native integration layers (**iOS via SwiftUI** and **Android via Kotlin Intents**), migrating the communication glue code into a strict **Clean Architecture + MVVM** design pattern. 

All hardcoded business logic, UI rendering, and deep-linking routines have been fully decoupled from the framework entry points (`AppDelegate` and `MainActivity`), establishing a highly scalable, robust codebase.

---

## 🛠 What Was Done

### 1. Architectural Restructuring (Clean Architecture)
* **Composition Root Separation:** `MainActivity.kt` and `AppDelegate.swift` were stripped of business logic. They now act strictly as entry points for the cross-platform framework wrapper, managing dependency injection and initializing method channels.
* **Domain Layer Isolation:** Core models (`Address`) and explicit Use Cases (`OpenGoogleMapsUseCase`, `AbrirAppleMapsUseCase`, `AbrirGoogleMapsUseCase`) were decoupled from platform frameworks to enforce single-responsibility principles.
* **State & Presentation Lifecycle Management:** * **iOS:** Leveraged Combine bindings in `AddressListViewModel` to reactively stream persistent address models into an isolated visual component tree (`NativeAddressListView` / `AddressRowView`).
  * **Android:** Wrapped `MethodChannel.Result` inside Kotlin's native `Result` monad structure to enforce safer runtime execution on async platform intents.

### 2. Framework & Memory Safeguards (Flutter/Dart)
* **Async Gap Thread-Safety:** Integrated `context.mounted` evaluation barriers within asynchronous callback contexts before dispatching visual messenger frames (`ScaffoldMessenger`), eliminating potential runtime memory leaks or UI element detach crashes.
* **Code Generation Alignment:** Refactored data transfer object layout schema configuration targets inside `CepDto`. Relocated metadata decorators (`@JsonSerializable`) onto structural boundaries to comply with strict workspace lint constraints (`invalid_annotation_target`) during source generation runs.

---

## 📂 Architecture Blueprint

### Android Module
```text
android/app/src/main/java/br/com/matheuskittler/via_cep/
│
├── domain/
│   ├── model/
│   │   └── Address.kt
│   └── usecase/
│       └── OpenGoogleMapsUseCase.kt
│
├── presentation/
│   └── channel/
│       └── MapsMethodChannelHandler.kt
│
└── MainActivity.kt
```
---

### iOS Module
```text
ios/Runner/
│
├── Domain/
│   ├── Models/
│   │   └── EnderecoSalvo.swift
│   └── UseCases/
│       ├── AbrirAppleMapsUseCase.swift
│       └── AbrirGoogleMapsUseCase.swift
│
├── Data/
│   └── Repositories/
│       └── EnderecoRepository.swift
│
├── Presentation/
│   ├── ViewModels/
│   │   └── AddressListViewModel.swift
│   └── Views/
│       ├── NativeAddressListView.swift
│       └── AddressRowView.swift
│
└── AppDelegate.swift
```
