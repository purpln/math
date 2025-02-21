// swift-tools-version: 5.5

import PackageDescription

let package = Package(name: "Math", products: [
    .library(name: "Math", targets: ["Math"]),
], targets: [
    .target(name: "Math", dependencies: [
        "Mathematics"
    ]),
    .systemLibrary(name: "Mathematics"),
])
