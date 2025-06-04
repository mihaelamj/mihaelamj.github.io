// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IgniteStarter",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/twostraws/Ignite.git", branch: "main"),
        .package(url: "https://github.com/mihaelamj/cvbuilder.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "IgniteStarter",
            dependencies: [
                .product(name: "Ignite", package: "Ignite"),
                .product(name: "CVBuilder", package: "cvbuilder"),
                .product(name: "CVBuilderIgnite", package: "cvbuilder")
            ]
        ),
    ]
)
