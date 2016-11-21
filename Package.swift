import PackageDescription

let package = Package(
  name: "colorizer",
  dependencies: [
    .Package(url: "https://github.com/jakeheis/SwiftCLI", majorVersion: 2, minor: 0),
    .Package(url: "https://github.com/kylef/PathKit.git", majorVersion: 0, minor: 7)
  ]
)

