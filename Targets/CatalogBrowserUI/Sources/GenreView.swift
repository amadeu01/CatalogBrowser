import SwiftUI
import SharedModel

public struct GenreView: View {
    public let contentData: Genre

    public var body: some View {
        VStack {
            Text(self.contentData.name)
        }.navigationTitle(self.contentData.name)
    }
}

#if DEBUG
struct GenreView_Previews: PreviewProvider {
    static let data: Genre = .init(
        id: "12",
        name: "Funk",
        slug: "Slug",
        children: []
    )

    static var previews: some View {
        GenreView(contentData: data)
    }
}
#endif
