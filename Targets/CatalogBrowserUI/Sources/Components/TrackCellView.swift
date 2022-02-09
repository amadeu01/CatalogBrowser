import SwiftUI
import SharedModel
import NukeUI

public struct TrackCellView: View {
    public let contentData: Track

    public var body: some View {
        HStack(alignment: .center) {
            imageView().frame(width: 100)
            VStack(alignment: .leading) {
                Text("🎵 " + self.contentData.title)
                    .fixedSize(horizontal: false, vertical: true)
                Divider()
                Text("🧑‍🎤 " + self.contentData.artists.joined(separator: ", "))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
    }

    func imageView() -> some View {
        VStack {
            Spacer()
            LazyImage(
                source: self.contentData.imageUrl,
                resizingMode: .aspectFit
            )
            Spacer()
        }
    }
}

private extension Track {
    var imageUrl: String {
        self.coverArt.baseURL + self.coverArt.sizes.s
    }
}

#if DEBUG
struct TrackCellView_Previews: PreviewProvider {
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
        TrackCellView(contentData: data)
    }
}
#endif
