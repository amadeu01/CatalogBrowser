import SwiftUI
import SharedModel

public struct TrackView: View {
    public let contentData: Track

    public var body: some View {
        VStack {
            Text(self.contentData.json)
        }
    }
}

extension Track {
    var json: String {
        guard let data = try? JSONEncoder().encode(self) else {
            return ""
        }

        let json = String(data: data, encoding: .utf8)
        return json ?? ""
    }
}

public extension Track {
    static var mock: Track {
        .init(
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
    }
}

#if DEBUG
struct TrackView_Previews: PreviewProvider {
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
        TrackView(contentData: data)
            .frame(width: 200, height: 400, alignment: .center)
    }
}
#endif
