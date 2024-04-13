// DetailView.swift

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            EmptyView()
        case .success:
            EmptyView()
        }
    }
}

extension DetailView {
    class ViewModel: ObservableObject {
        @Published var state: State = .loading
    }

    enum State {
        case loading
        case error
        case success
    }
}

#Preview {
    DetailView(viewModel: .init())
}
