// swift-tools-version: 5.5

import PackageDescription

let package = Package(name: "math", products: [
    .library(name: "math", targets: ["math"]),
    .library(name: "simd", targets: ["simd"]),
], targets: [
    .systemLibrary(name: "math"),
    .target(name: "simd", dependencies: [
        "math"
    ], cSettings: [
        .unsafeFlags(["-ffast-math"])
    ]),
    .executableTarget(name: "Test", dependencies: [
        "math", "simd"
    ])
])
