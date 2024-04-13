// DetailController.swift

import SwiftUI

class DetailController: UIHostingController<DetailView> {
    private weak var coordinator: MainCoordinator?

    private let viewModel: DetailView.ViewModel

    init(coordinator: MainCoordinator, id: String) {
        self.coordinator = coordinator

        let viewModel = DetailView.ViewModel()
        self.viewModel = viewModel
        super.init(rootView: .init(viewModel: viewModel))

        self.navigationItem.title = id
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
