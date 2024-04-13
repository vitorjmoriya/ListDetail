// DetailView.swift

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ViewModel

    @SwiftUI.State var imageId = UUID()

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            EmptyView()
        case .success(let url):
            renderSuccessView(url: url)
        }
    }

    @ViewBuilder private func renderSuccessView(url: URL) -> some View {
        VStack(spacing: 10) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    ErrorMessage {
                        self.imageId = UUID()
                    }
                }
            }
            .id(imageId)

            Text("Tags: \(viewModel.tags)")
        }
        .padding(.horizontal, 10)
    }
}

extension DetailView {
    class ViewModel: ObservableObject {
        @Published var state: State = .loading

        let tags: String

        init(tags: String) {
            self.tags = tags
        }
    }

    enum State {
        case loading
        case error
        case success(URL)
    }
}

#Preview {
    DetailView(viewModel: .init(tags: ""))
}
