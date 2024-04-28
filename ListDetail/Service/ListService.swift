// ListService.swift

import Foundation

class ListService {
    private let viewModel: ListView.ViewModel
    private let worker: CatWorkerProtocol

    init(viewModel: ListView.ViewModel, dataSource: DataSource) {
        self.viewModel = viewModel
        switch dataSource {
        case .api:
            self.worker = CatWorker()
        case .json:
            self.worker = CatWorkerJSON()
        }
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

extension ListService {
    enum DataSource {
        case api
        case json
    }
}
