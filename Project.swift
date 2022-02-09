import ProjectDescription
import ProjectDescriptionHelpers

func makeFeatureTargets() -> [Target] {
    let ui = Project.featureFramework(
        name: "CatalogBrowserUI",
        dependencies: [
            .target(name: "SharedModel"),
            .target(name: "Common"),
            .external(name: "NukeUI")
        ]
    )
    let apiClient = Project.featureFramework(
        name: "EpidemicSoundAPIClient",
        dependencies: [
            .target(name: "SharedModel"),
            .target(name: "Common")
        ],
        testDependencies: [
            .external(name: "Difference"),
            .external(name: "Mocker")
        ]
    )

    let models = Project.featureFramework(
        name: "SharedModel",
        prodOnly: true
    )

    let common = Project.featureFramework(
        name: "Common",
        dependencies: [
            .target(name: "SharedModel")
        ],
        prodOnly: true
    )

    return ui + apiClient + models + common
}


let project = Project.app(
    name: "CatalogBrowser",
    platform: .iOS,
    featureTargets: makeFeatureTargets(),
    additionalTargets: [
        .target(name: "CatalogBrowserUI"),
        .target(name: "EpidemicSoundAPIClient")
    ]
)
