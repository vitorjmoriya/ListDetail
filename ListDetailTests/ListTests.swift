// ListTests.swift

import XCTest
import SnapshotTesting
import SwiftUI
@testable import ListDetail

final class ListTests: XCTestCase {
    override func setUp() {
        super.setUp()
        isRecording = false
    }

    func testStatesSnapshot() {
        let viewModel = ListView.ViewModel()
        let controller = UIHostingController(rootView: ListView(viewModel: viewModel))

        assertSnapshot(of: controller, as: .image(on: .iPhone13ProMax), testName: "loading")

        viewModel.state = .error

        assertSnapshot(of: controller, as: .image(on: .iPhone13ProMax), testName: "error")

        viewModel.state = .success([
            .init(title: "item 1", subtitle: "foobar"),
            .init(title: "item 2", subtitle: "foobar 2")
        ])

        assertSnapshot(of: controller, as: .image(on: .iPhone13ProMax), testName: "success")
    }
}
