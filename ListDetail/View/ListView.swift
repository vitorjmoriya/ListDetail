// ListView.swift

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .error:
            EmptyView()
        case .success(let data):
            renderList(data: data)
        }
    }

    @ViewBuilder private func renderList(data: [Card.ViewModel]) -> some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                ForEach(data, id: \.title) { item in
                    Card(viewModel: item)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

extension ListView {
    class ViewModel: ObservableObject {
        var onTapItemList: ((Int) -> Void)?

        @Published var state: State = .loading
    }

    enum State {
        case loading
        case error
        case success([Card.ViewModel])
    }
}

#Preview {
    ListView(viewModel: .init())
}
