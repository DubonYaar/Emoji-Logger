// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Emoji-Logger",
    platforms: [
        .iOS(.v11)
    ],
      products: [
        .library(name: "Logger", targets: ["Logger"]),
    ],
    dependencies: [
    ],
  
    targets: [
        .target(name: "Logger",  dependencies: [], path: "")
    ]
)
