import ProjectDescription
import ProjectDescriptionHelpers

func makeFeatureTargets() -> [Target] {
    let ui = Project.featureFramework(
        name: "CatalogBrowserUI",
        dependencies: [
            .target(name: "SharedModel"),
            .external(name: "NukeUI")
        ]
    )
    let apiClient = Project.featureFramework(
        name: "EpidemicSoundAPIClient",
        dependencies: [
            .target(name: "SharedModel")
        ],
        testDependencies: [
            .external(name: "Difference"),
            .external(name: "Mocker")
        ]
    )

    let models = Project.featureFramework(
        name: "SharedModel",
        testDependencies: []
    )

    return ui + apiClient + models
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
