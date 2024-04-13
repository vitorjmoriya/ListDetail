// ListService.swift

import Foundation

class ListService {
    private let viewModel: ListView.ViewModel

    init(viewModel: ListView.ViewModel) {
        self.viewModel = viewModel
    }

    @MainActor func fetchData() async {
        viewModel.state = .loading

        do {
            let data = try await CatWorker.fetchAllCatsData()

            let cardsViewModel: [Card.ViewModel] = data.map { item in
                .init(title: item.id, subtitle: item.tags.joined(separator: ","))
            }

            viewModel.state = .success(cardsViewModel)
        } catch {
            viewModel.state = .error
        }
    }
}
