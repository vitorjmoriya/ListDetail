// ListController.swift

import SwiftUI

class ListController: UIHostingController<ListView> {
    private weak var coordinator: MainCoordinator?

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(rootView: .init(viewModel: .init()))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
