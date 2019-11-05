// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// I have a problem running tests with the swift package-- (https://github.com/kishikawakatsumi/KeychainAccess/issues/399)
// but am able to run them in the Cocoapod.

let package = Package(
    name: "PersistentValue",
    platforms: [
        // Minimum needed for SwiftyUserDefaults
        .macOS(.v10_11)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PersistentValue",
            targets: ["PersistentValue"]),
    ],
    dependencies: [
        // Trying to resolve "GenericCache: cyclic metadata dependency detected, aborting"
        .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults.git", from: "5.0.0-beta"),
        // .package(url: "https://github.com/sunshinejr/SwiftyUserDefaults.git", from: "4.0.0"),
        
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "3.2.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PersistentValue",
            dependencies: ["SwiftyUserDefaults", "KeychainAccess"]),
        .testTarget(
            name: "PersistentValueTests",
            dependencies: ["PersistentValue", "SwiftyUserDefaults", "KeychainAccess"]),
    ]
)
