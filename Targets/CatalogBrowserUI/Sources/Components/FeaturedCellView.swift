import SwiftUI
import SharedModel
import NukeUI

public struct FeatureCellView: View {
    public let contentData: FeaturedElement

    public var body: some View {
        VStack {
            imageView()
            Text(self.contentData.title)
        }
    }

    func imageView() -> some View {
        HStack {
            Spacer()
            LazyImage(
                source: self.contentData.image,
                resizingMode: .aspectFit
            ).frame(height: 120)
            Spacer()
        }
    }
}

#if DEBUG
struct FeatureCellView_Previews: PreviewProvider {
    static let data: FeaturedElement = .init(
        type: .genre,
        id: "1346",
        title: "Beats",
        image: "https://images.ctfassets.net/ojtnytzl1djm/4Mm4kJ9nwasLwZpQ54472a/90f35901413025d5a627fa132f6c2b56/Beats.jpg"
    )

    static var previews: some View {
        FeatureCellView(contentData: data)
    }
}
#endif
