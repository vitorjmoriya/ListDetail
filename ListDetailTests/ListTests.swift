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

        assertSnapshot(of: controller, as: .image(on: .iPhone15), testName: "loading")

        viewModel.state = .error

        assertSnapshot(of: controller, as: .image(on: .iPhone15), testName: "error")
    }
}
