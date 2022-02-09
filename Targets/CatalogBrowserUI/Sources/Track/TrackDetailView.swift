import SwiftUI
import SharedModel
import NukeUI


public struct TrackDetailView: View {
    public let contentData: Track

    public var body: some View {
        List {
            Section {
                cover()
            }

            Section("Metadata") {
                Text("ID: \(self.contentData.id)")
                Text("Title: \(self.contentData.title)")
                Text("Artists: \(self.contentData.artists.joined(separator: ", "))")
                Text("Length: \(self.contentData.length) min")
                Text("BPM: \(self.contentData.bpm)")
                Text("HasVocals: \(self.contentData.hasVocals ? "Yes" : "No")")
                Text("EnergyLevel: \(self.contentData.energyLevel)")
                Text("genres: \(self.contentData.genres.joined(separator: ", "))")
                Text("publicSlug: \(self.contentData.publicSlug)")
            }
        }.navigationTitle("🎵 " + self.contentData.title)
    }

    func cover() -> some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                Spacer()
                LazyImage(
                    source: self.contentData.imageUrl,
                    resizingMode: .aspectFit
                )
                Spacer()
            }.frame(width: 200, height: 200)
            Spacer()
        }
    }
}

private extension Track {
    var imageUrl: String {
        self.coverArt.baseURL + self.coverArt.sizes.m
    }
}

#if DEBUG
struct TrackDetailView_Previews: PreviewProvider {
    static let data: Track = .init(
        id: 1,
        title: "Music",
        artists: [],
        length: 1,
        stemFull: .init(
            stemType: "",
            s3TrackID: 1,
            lqMp3URL: "",
            waveformURL: ""
        ),
        bpm: 21,
        hasVocals: true,
        energyLevel: "",
        genres: [],
        moods: [],
        publicSlug: "",
        coverArt: .init(
            baseURL: "",
            sizes: .init(xs: "", s: "", m: "", l: "")
        )
    )

    static var previews: some View {
        TrackDetailView(contentData: data)
            .frame(width: 200, height: 400, alignment: .center)
    }
}
#endif
