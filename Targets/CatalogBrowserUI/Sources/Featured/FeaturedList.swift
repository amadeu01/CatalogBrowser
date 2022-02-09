import SwiftUI
import SharedModel
import NukeUI
import Common

public struct FeaturedListView: View {

    @State private(set) var featuredList: Loadable<Featured>
    @Environment(\.injected) private var injected: DIContainer
    
    private var loadFeatureData: LoadFeatureDataInteractor {
        self.injected.interactors.loadFeatureData
    }

    public init(
        featuredList: Loadable<Featured> = .notRequested
    ) {
        self.featuredList = featuredList
    }

    public var body: some View {
        NavigationView {
            self.content
                .navigationBarTitle("Featured")
                .animation(.easeOut, value: 0.3)
        }
    }

    private var content: AnyView {
        switch featuredList {
        case .notRequested: return AnyView(notRequestedView)
        case .isLoading: return AnyView(loadingView())
        case let .loaded(featuredData):
            return AnyView(loadedView(featuredData))
        case let .failed(error): return AnyView(failedView(error))
        }
    }
}

// MARK: - Loading Content

private extension FeaturedListView {
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

private extension FeaturedListView {
    func reload() async {
        do {
            let featureData = try await self.loadFeatureData()
            self.featuredList = .loaded(featureData)
        } catch {
            self.featuredList = .failed(error)
        }
    }
}

// MARK: - Displaying Content

private extension FeaturedListView {
    func loadedView(
        _ featuredData: Featured
    ) -> some View {
        ScrollView{
            LazyVStack(alignment: .center, spacing: 4) {
                Spacer()
                ForEach(featuredData, id: \.self) { data in
                    sectionView(data)
                    Divider()
                    Spacer()
                }
            }
        }.padding(.bottom, 0)
    }

    private func sectionView(
        _ sections: [FeaturedElement]
    ) -> some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 8) {
                ForEach(sections, id: \.id) { featuredItem in
                    featuredItemView(featuredItem)
                }
            }
        }.frame(height: 150).padding()
    }

    private func featuredItemView(
        _ featuredItem: FeaturedElement
    ) -> some View {
        NavigationLink {
            FeaturedElementDetailView(
                contentData: featuredItem
            )
        } label: {
            FeatureCellView(
                contentData: featuredItem
            ).padding()
                .frame(width: 140, height: 140)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

