import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
        .remote(
            url: "https://github.com/WeTransfer/Mocker.git",
            requirement: .upToNextMajor(from: "2.3.0")
        ),
        .remote(
            url: "https://github.com/krzysztofzablocki/Difference.git",
            requirement: .upToNextMajor(from: "1.0.0")
        ),
        .remote(
            url: "https://github.com/kean/NukeUI.git",
            requirement: .upToNextMajor(from: "0.8.0")
        )
    ],
    platforms: [.iOS]
)
