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
        case .success:
            EmptyView()
        }
    }
}

extension ListView {
    class ViewModel: ObservableObject {
        var onTapItemList: ((Int) -> Void)?

        var state: State = .loading
    }

    enum State {
        case loading
        case error
        case success
    }
}

#Preview {
    ListView(viewModel: .init())
}
