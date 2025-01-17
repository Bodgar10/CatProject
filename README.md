# Project Overview

This project is a modular iOS app using Swift Package Manager to manage dependencies locally. It contains several modules, including `Common`, `NetworkSDK`, `DesignSystem`, and `Switchboard`. The app demonstrates the use of reusable components, network requests, and navigation in SwiftUI.

## Modules Included

### 1. `Common`

The `Common` module contains shared functionality, extensions, and utilities that can be reused across other modules. This module is designed to provide commonly used components and helper functions to simplify the development process.

### 2. `NetworkSDK`

The `NetworkSDK` module provides reusable networking abstractions, including an HTTP client protocol (`HTTPClient`) and a default implementation (`URLSessionNetwork`). It supports common HTTP methods, customizable headers, and request bodies.

Unit tests are included in this module to ensure its correctness and reliability.

#### Example Usage:
A service within `NetworkSDK` fetches data from a cute cats API:

```swift
final class CuteCatsAPIService {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient = URLSessionNetwork()) {
        self.httpClient = httpClient
    }

    func fetchCats() {
        guard let url = URL(string: "https://cataas.com/api/cats?tags=cute") else { return }
        Task {
            do {
                let cats: [CatResponse] = try await httpClient.get(from: url, httpMethod: .GET)
                print(cats)
            } catch {
                print("Error fetching cats: \(error)")
            }
        }
    }
}
```

### DesignSystem

The DesignSystem module contains reusable UI components built with SwiftUI. It includes a small app demo that displays a table of components.

- **App Demo**: Upon compiling and running the app, you will see a table of cats fetched from the NetworkSDK. Each cell in the table is clickable, and when clicked, it navigates to a simple detail screen using NavigationLink.

### Switchboard

The Switchboard module provides a set of protocols that allow communication between different feature modules. It enables services or views to communicate without tight coupling, enhancing modularity and scalability.

## How to Use

### 1. Setup and Dependencies
To set up the project, all modules are included as local dependencies using Swift Package Manager. The following modules are available:

- Common
- NetworkSDK
- DesignSystem
- Switchboard

To include them in your project, follow the standard Swift Package Manager process to add local packages.

### 2. Run the App

When you compile and run the app, the following will happen:

- The DesignSystem module will display a table of cute cats fetched from the NetworkSDK.
- Each table cell represents a cat and is clickable.
- Clicking a cell will navigate to a simple detail screen showing more information about the selected cat using NavigationLink.

### 3. Testing
Unit tests are provided for the NetworkSDK module to ensure network requests and error handling work as expected. You can run these tests using Xcode's test navigator.

## Project Structure
- **Common/**: Contains reusable functionality.
- **NetworkSDK/**: Contains networking abstractions and the network client implementation.
- **DesignSystem/**: Contains UI components and a demo app displaying a table of cats.
- **Switchboard/**: Contains communication protocols between modules.
- **App.xcproj/**: Main Xcode project containing the entry point, UI, and navigation logic for the app.

