// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Switchboard",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Switchboard",
            targets: ["Switchboard"]),
    ],
    dependencies: [.package(path: "../../../Modules/Common/Common"),],
    targets: [
        .target(
            name: "Switchboard", dependencies: [.product(name: "Common", package: "Common"),]),
        .testTarget(
            name: "SwitchboardTests",
            dependencies: ["Switchboard"]),
    ],
    swiftLanguageVersions: [.v5]
)
