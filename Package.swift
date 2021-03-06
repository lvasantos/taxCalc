// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "conversor",
    platforms: [.macOS(.v12)],
    products: [
            .library(name: "conversor", targets:["conversor"]),
            .executable(name: "conversorExec", targets: ["conversorExec"])
        ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(
                name: "conversor",
                dependencies: ["SwiftSoup"]),
            .executableTarget(
                name: "conversorExec",
                dependencies: ["conversor"]
            ),
            .testTarget(
                name: "conversorTests",
                dependencies: ["conversor"]),
        ]
)
