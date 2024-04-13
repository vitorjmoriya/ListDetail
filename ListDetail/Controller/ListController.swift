// ListController.swift

import SwiftUI

class ListController: UIHostingController<ListView> {
    private weak var coordinator: MainCoordinator?

    private let service: ListService

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator

        let viewModel = ListView.ViewModel()

        self.service = .init(viewModel: viewModel)
        super.init(rootView: .init(viewModel: viewModel))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await self.service.fetchData()
        }
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
