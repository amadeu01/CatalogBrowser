import SwiftUI
import SharedModel
import NukeUI

public struct MoodView: View {
    public let contentData: Mood

    public var body: some View {
        VStack {
            Text(self.contentData.name)
        }.navigationTitle(self.contentData.name)
    }
}

#if DEBUG
struct MoodView_Previews: PreviewProvider {
    static let data: Mood = .init(
        id: "12",
        name: "Funk",
        slug: "Slug"
    )

    static var previews: some View {
        MoodView(contentData: data)
    }
}
#endif
