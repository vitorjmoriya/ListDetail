// DetailController.swift

import SwiftUI

class DetailController: UIHostingController<DetailView> {
    private weak var coordinator: MainCoordinator?

    private let viewModel: DetailView.ViewModel
    private let service: DetailService

    init(coordinator: MainCoordinator, id: String, tags: String) {
        self.coordinator = coordinator

        let viewModel = DetailView.ViewModel(tags: tags)
        self.viewModel = viewModel
        self.service = .init(viewModel: viewModel, id: id)
        super.init(rootView: .init(viewModel: viewModel))

        self.navigationItem.title = id
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            service.fetchData()
        }
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
