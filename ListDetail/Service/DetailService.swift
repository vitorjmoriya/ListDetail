// DetailService.swift

import Foundation

class DetailService {
    private let viewModel: DetailView.ViewModel
    private let id: String

    init(viewModel: DetailView.ViewModel, id: String) {
        self.viewModel = viewModel
        self.id = id
    }

    func fetchData() {
        do {
            let data = try CatWorker.getCatPhotoURL(id: self.id)

            viewModel.state = .success(data)
        } catch {
            viewModel.state = .error
        }
    }
}
