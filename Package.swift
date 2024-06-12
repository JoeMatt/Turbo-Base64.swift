// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Turbo-Base64.swift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Turbo-Base64.swift",
            targets: ["Turbo-Base64.swift"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Turbo-Base64.swift",
            dependencies: ["Turbo-Base64"]),

        .target(
            name: "Turbo-Base64",
            sources: [
                "Turbo-Base64/turbob64c.c",
                "Turbo-Base64/turbob64d.c",
                "Turbo-Base64/turbob64v128.c",
//                "Turbo-Base64/turbob64v256.c",  // AMD64
//                "Turbo-Base64/turbob64v512.c" // AMD64
            ],
            cSettings: [
                .define("NDEBUG"),
                .unsafeFlags([
                    "-falign-loops",
                    "-fomit-frame-pointer",
                    "-fstrict-aliasing"
                ])
            ]
        ),

        .executableTarget(
            name: "benchmark",
            dependencies: ["Turbo-Base64"],
            cSettings: [
                .headerSearchPath("../Turbo-Base64/Turbo-Base64/")
            ]
        ),

        .testTarget(
            name: "Turbo-Base64.swiftTests",
            dependencies: ["Turbo-Base64.swift"]),
    ],
    cLanguageStandard: .c2x
)
