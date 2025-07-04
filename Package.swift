// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "GenerativeAIUIComponents",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "GenerativeAIUIComponents", targets: ["GenerativeAIUIComponents"]),
        .library(name: "GenerativeAICore", targets: ["GenerativeAICore"]),
        .executable(name: "DemoApp", targets: ["DemoApp"])
    ],
    dependencies: [
        .package(url: "https://github.com/google-gemini/generative-ai-swift.git", from: "0.5.6"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.5.0")
    ],
    targets: [
        .target(
            name: "GenerativeAICore",
            dependencies: [
                .product(name: "GoogleGenerativeAI", package: "generative-ai-swift")
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "GenerativeAIUIComponents",
            dependencies: [
                "GenerativeAICore",
                .product(name: "Lottie", package: "lottie-ios")
            ],
            resources: [.process("Resources")],
            path: "Sources/UIComponents"
        ),
        .executableTarget(
            name: "DemoApp",
            dependencies: ["GenerativeAIUIComponents"],
            path: "DemoApp"
        ),
        .testTarget(
            name: "GenerativeAIUITests",
            dependencies: ["GenerativeAIUIComponents"],
            path: "Tests/GenerativeAIUITests"
        )
    ]
)
