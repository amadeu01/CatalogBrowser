import SwiftUI
import SharedModel
import NukeUI
import Common

public struct TrackListView: View {
    private let featureElement: FeaturedElement
    @State private(set) var tracks: Loadable<[Track]>
    @Environment(\.injected) private var injected: DIContainer
    
    private var loadTracksData: () async throws -> [Track] {
        let load = self.featureElement.type == .genre ?
        self.injected.interactors.loadTracksDataForGenre :
        self.injected.interactors.loadTracksDataForMood

        return {
            try await load(self.featureElement.title)
        }
    }

    public init(
        featureElement: FeaturedElement,
        tracks: Loadable<[Track]> = .notRequested
    ) {
        self.featureElement = featureElement
        self.tracks = tracks
    }

    public var body: some View {
        self.content
            .navigationTitle("Tracks")
            .animation(.easeOut, value: 0.3)
    }

    private var content: AnyView {
        switch tracks {
        case .notRequested: return AnyView(notRequestedView)
        case .isLoading: return AnyView(loadingView())
        case let .loaded(tracks):
            return AnyView(loadedView(tracks))
        case let .failed(error): return AnyView(failedView(error))
        }
    }
}

// MARK: - Loading Content

private extension TrackListView {
    var notRequestedView: some View {
        Text("").onAppear {
            Task { await reload() }
        }
    }

    func loadingView() -> some View {
        AnyView(ProgressView().padding())
    }

    func failedView(_ error: Error) -> some View {
        ErrorView(
            error: error,
            retryAction: {
                Task { await self.reload() }
            }
        )
    }
}

// MARK: - Side Effects

private extension TrackListView {
    func reload() async {
        do {
            let tracks = try await self.loadTracksData()
            self.tracks = .loaded(tracks)
        } catch {
            self.tracks = .failed(error)
        }
    }
}

// MARK: - Displaying Content

private extension TrackListView {
    func loadedView(
        _ tracks: [Track]
    ) -> some View {
        List(tracks, id: \.id) { track in
            trackItemView(track)
        }
    }

    func trackItemView(
        _ track: Track
    ) -> some View {
        NavigationLink {
            TrackDetailView(contentData: track)
        } label: {
            TrackCellView(
                contentData: track
            ).padding()
                .frame(height: 140)
        }
    }
}

#if DEBUG
struct TrackListView_Previews: PreviewProvider {
    static let data: FeaturedElement = .init(
        type: .genre,
        id: "1",
        title: "Funk",
        image: ""
    )

    static var previews: some View {
        TrackListView(
            featureElement: self.data,
            tracks: .notRequested
        )
    }
}
#endif
