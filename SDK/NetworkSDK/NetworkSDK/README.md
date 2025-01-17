# NetworkSDK Module

The `NetworkSDK` module provides a robust and reusable networking layer for the application. It is designed to abstract and centralize HTTP communication, enabling developers to interact with network APIs in a clean, testable, and scalable manner.

## Objective

The goal of the `NetworkSDK` module is to encapsulate network communication using a protocol-oriented approach. It allows developers to implement custom clients or use the provided `URLSessionNetwork` implementation for common tasks.

## Key Features

- **Protocol-Oriented Networking**: The `HTTPClient` protocol defines a generic interface for making HTTP requests. This ensures flexibility and testability.
- **Default Implementation**: The `URLSessionNetwork` class provides a default implementation of the `HTTPClient` protocol using `URLSession`.
- **Asynchronous Support**: Built-in support for async/await for modern and efficient network communication.
- **Error Handling**: Provides structured error handling for network responses and decoding.

## HTTPClient Protocol

The `HTTPClient` protocol defines the core methods for making network requests. Example usage:

```swift
public protocol HTTPClient {
    func get<T: Decodable>(from url: URL, httpMethod: HTTPMethod, headers: [String: String]?, body: Data?) async throws -> T
}
```

## Developers can implement their own custom clients conforming to this protocol or use the provided implementation, `URLSessionNetwork`.

### Default Implementation: URLSessionNetwork

The `URLSessionNetwork` class is the default implementation of the `HTTPClient` protocol, utilizing `URLSession` to perform network requests. It supports common HTTP methods, customizable headers, and request bodies.

#### To use this implementation:

1. **Instantiate `URLSessionNetwork`:**

    ```swift
    let httpClient = URLSessionNetwork()
    ```

2. **Use it to fetch data from an API:**

    ```swift
    let data: YourDecodableModel = try await httpClient.get(
        from: yourURL, 
        httpMethod: .GET, 
        headers: nil, 
        body: nil
    )
    ```
    
### What Should Be Included

- **Networking Abstractions**: Protocols like HTTPClient and reusable implementations like URLSessionNetwork.
- **Common HTTP Utilities**: Types such as HTTPMethod, error types like NetworkError, and utility methods.
- **Testing Support**: Mockable networking interfaces to enable unit testing for modules that depend on NetworkSDK.

### What Should NOT Be Included

- **Feature-Specific Logic**: Business logic or feature-specific services should reside in the respective feature modules.
- **UI Components**: Avoid including views or view-related code in the NetworkSDK.
- **External Dependencies**: Minimize dependencies on third-party libraries to ensure flexibility and maintainability.

