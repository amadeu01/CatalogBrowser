import SwiftUI
import SharedModel
import NukeUI

public struct FeaturedElementDetailView: View {
    public let contentData: FeaturedElement

    public var body: some View {
        List {
            imageView().frame(height: 150)
            Section("Info") {
                Text(self.contentData.id)
                Text(self.contentData.title)
                Text(self.contentData.typeName)
            }

            Section() {
                NavigationLink {
                    TrackListView(
                        featureElement: self.contentData
                    )
                } label: {
                    Text("Tracks")
                }
            }
        }.navigationTitle(self.contentData.title)
    }

    func imageView() -> some View {
        HStack {
            Spacer()
            LazyImage(
                source: self.contentData.image,
                resizingMode: .aspectFit
            )
            Spacer()
        }
    }
}

private extension FeaturedElement {
    var typeName: String {
        self.type == .genre ? "Genre" : "Mood"
    }
}

#if DEBUG
struct FeaturedElementDetailView_Previews: PreviewProvider {
    static let data: FeaturedElement = .init(
        type: .genre,
        id: "12",
        title: "Funk",
        image: ""
    )

    static var previews: some View {
        FeaturedElementDetailView(contentData: data)
    }
}
#endif
