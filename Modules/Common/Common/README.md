# Common Module

The `Common` module is a foundational part of the project that provides reusable, generic components and utilities that can be shared across feature modules. Its primary objective is to promote code reuse and maintainability by consolidating shared logic and functionality in a centralized location.

## Objective

The `Common` module serves as a repository for utilities, extensions, protocols, and generic implementations that can be leveraged by other modules. It ensures consistency and reduces redundancy across the codebase while adhering to best practices like modularization and single responsibility.

---

## Contents

### What Should Be Included

- **Generic Classes and Functions**: Utilities and helper classes that are not specific to any feature, such as data transformers or generic validation logic.
- **Extensions**: Common extensions for Foundation or Swift standard library types (e.g., `String`, `Date`, etc.) that provide enhanced functionality.
- **Protocols**: Interfaces defining generic behaviors or contracts that multiple modules can implement.
- **Service Locator Pattern**: A robust implementation of a service registry for dependency management, allowing modules to dynamically resolve and manage dependencies. Below is the Service Locator implementation included in this module:

```swift
/// A service is an interface to part of the domain
public protocol Service: AnyObject {
    /// A unique way to identify a service instance
    var id: UUID { get }
}

/// Property Wrapper to access the ServiceLocator.get and resolve dependencies.
@propertyWrapper
public struct Dependency<Service> {
    public var service: Service

    public init() {
        guard let service = ServiceLocator.get(Service.self) else {
            fatalError("No dependency of type \(String(describing: Service.self)) registered!")
        }
        self.service = service
    }

    public var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}

/// Enum to define registration types.
enum ServiceRegistrationType<T> {
    case notInstantiated(() -> T)
    case instantiated(T)
}

/// Provides a registry of instances of types conforming to Service.
public final class ServiceLocator {
    private static var services = [String: ServiceRegistrationType<Any>]()

    /// Registers a service with a closure for lazy instantiation.
    public static func register<T>(_ type: T.Type, factory: @autoclosure @escaping () -> T) {
        let key = "\(type)"
        services[key] = .notInstantiated(factory)
    }

    /// Retrieves a registered service.
    public static func get<T>(_ type: T.Type = T.self) -> T? {
        let key = "\(T.self)"

        switch services[key] {
        case .notInstantiated(let factory):
            let instance = factory()
            services[key] = .instantiated(instance)
            return instance as? T
        case .instantiated(let instance as T):
            return instance
        default:
            return nil
        }
    }

    /// Removes a registered service.
    public static func remove<T>(_ type: T.Type = T.self) {
        let key = "\(T.self)"
        services[key] = nil
    }
}
```

## What Should NOT Be Included

- **Feature-Specific Logic**: Any code tied to a particular feature or business domain should reside in the corresponding feature module.
- **UI Components**: Avoid including UI-related classes, views, or view models. These should belong to feature or design system modules.
- **External Dependencies**: Avoid adding dependencies on external libraries unless they are explicitly necessary and applicable to all modules.
- **Hardcoded Constants**: Avoid feature-specific constants or configuration values.
