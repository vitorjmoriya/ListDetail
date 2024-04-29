// DetailTests.swift

import XCTest
import SnapshotTesting
import SwiftUI
@testable import ListDetail

final class DetailTests: XCTestCase {
    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func testStatesSnapshot() {
        let viewModel = DetailView.ViewModel(tags: "foobar")
        let controller = UIHostingController(rootView: DetailView(viewModel: viewModel))

        assertSnapshot(of: controller, as: .image(on: .iPhone15), testName: "loading")

        viewModel.state = .success(.init(string: ".")!)

        assertSnapshot(of: controller, as: .image(on: .iPhone15), testName: "invalid image")
    }
}
