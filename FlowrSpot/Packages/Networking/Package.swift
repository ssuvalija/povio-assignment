// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Networking",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Networking",
      targets: ["Networking"])
  ],
  dependencies: [
    .package(url: "https://github.com/poviolabs/PovioKit", .upToNextMajor(from: "2.0.0"))
  ],
  targets: [
    .target(
      name: "Networking",
      dependencies: [
        "PovioKit",
        .product(name: "PovioKitNetworking", package: "PovioKit"),
        .product(name: "PovioKitPromise", package: "PovioKit")
      ],
      path: "Sources/"
    ),
    .testTarget(
      name: "NetworkingTests",
      dependencies: ["Networking"]
    )
  ]
)
