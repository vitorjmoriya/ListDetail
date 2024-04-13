// ListController.swift

import SwiftUI

class ListController: UIHostingController<ListView> {
    private weak var coordinator: MainCoordinator?

    private let viewModel: ListView.ViewModel
    private let service: ListService

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator

        let viewModel = ListView.ViewModel()

        self.service = .init(viewModel: viewModel)
        self.viewModel = viewModel
        super.init(rootView: .init(viewModel: viewModel))

        setupActions()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await self.service.fetchData()
        }
    }

    func setupActions() {
        viewModel.onTapItemList = { [weak self] id, tags in
            guard let self else { return }

            self.coordinator?.navigateToDetail(id: id, tags: tags)
        }

        viewModel.onRetry = { [weak service] in
            Task {
                await service?.fetchData()
            }
        }
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
