import PackageDescription

let package = Package(
  name: "Shark",

  dependencies: [
    .Package(url: "https://github.com/kylef/PathKit.git", majorVersion: 0, minor: 6),
    .Package(url: "https://github.com/apple/swift-package-manager.git", majorVersion: 0)
  ]
)