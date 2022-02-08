import Foundation
import SharedModel

public enum EpidemicSoundResources {}

extension EpidemicSoundResources {
    public static func featured() -> FeatureResource {
        FeatureResource(path: "/featured")
    }

    public struct FeatureResource {
        public let path: String

        public var get: Request<Void, Featured> { .get(path) }
    }
}

extension EpidemicSoundResources {
    public static func catalog() -> CatalogResource {
        CatalogResource(path: "/catalog")
    }

    public struct CatalogResource {
        public let path: String

        public var get: Request<Void, Catalog> { .get(path) }
    }
}
