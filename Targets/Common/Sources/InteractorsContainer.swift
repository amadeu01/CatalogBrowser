import SharedModel

public typealias LoadFeatureDataInteractor = () async throws -> Featured
public typealias LoadTracksDataForMoodInteractor = (String) async throws -> [Track]
public typealias LoadTracksDataForGenreInteractor = (String) async throws -> [Track]

extension DIContainer {
    public struct Interactors {
        public let loadFeatureData: LoadFeatureDataInteractor
        public let loadTracksDataForMood: LoadTracksDataForMoodInteractor
        public let loadTracksDataForGenre: LoadTracksDataForGenreInteractor

        public init(
            loadFeatureData: @escaping LoadFeatureDataInteractor,
            loadTracksDataForMood: @escaping LoadTracksDataForMoodInteractor,
            loadTracksDataForGenre: @escaping LoadTracksDataForGenreInteractor
        ) {
            self.loadFeatureData = loadFeatureData
            self.loadTracksDataForMood = loadTracksDataForMood
            self.loadTracksDataForGenre = loadTracksDataForGenre
        }

        public static var stub: Self {
            .init(
                loadFeatureData: { [] },
                loadTracksDataForMood: { _ in [] },
                loadTracksDataForGenre: { _ in [] }
            )
        }
    }
}


