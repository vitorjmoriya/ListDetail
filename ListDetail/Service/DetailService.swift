// DetailService.swift

import Foundation

class DetailService {
    private let viewModel: DetailView.ViewModel
    private let id: String
    private let worker: CatWorkerProtocol

    init(viewModel: DetailView.ViewModel, id: String) {
        self.viewModel = viewModel
        self.id = id
        self.worker = CatWorker()
    }

    func fetchData() {
        do {
            let data = try worker.getCatPhotoURL(id: id)
            viewModel.state = .success(data)
        } catch {
            viewModel.state = .error
        }
    }
}
