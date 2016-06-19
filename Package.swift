import PackageDescription

let package = Package(
    name: "examples-for-ibm-swift-sandbox",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 8),
    ]
)
