// ListService.swift

import Foundation

class ListService {
    private let viewModel: ListView.ViewModel
    private let worker: CatWorkerProtocol

    init(viewModel: ListView.ViewModel) {
        self.viewModel = viewModel
        self.worker = CatWorker()
    }

    @MainActor func fetchData() async {
        viewModel.state = .loading

        do {
            let data = try await worker.fetchAllCatsData(limit: 10)

            let cardsViewModel: [Card.ViewModel] = data.map { item in
                var imageURL: URL?

                do {
                    imageURL = try worker.getCatPhotoURL(id: item.id, width: 50, height: 50)
                } catch {
                    // TODO: Log error
                }

                return .init(
                    imageURL: imageURL,
                    title: item.id,
                    subtitle: item.tags.joined(separator: ",")
                )
            }

            viewModel.state = .success(cardsViewModel)
        } catch {
            viewModel.state = .error
        }
    }
}
