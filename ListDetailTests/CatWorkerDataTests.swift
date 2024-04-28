// CatWorkerDataTests.swift

import XCTest
@testable import ListDetail

class CatWorkerDataTests: XCTestCase {
    func testDecodingValidJSON() throws {
        let json =
        """
        {
            "_id": "WRTVSzq2kNuOLPYn",
            "tags": ["Black"]
        }
        """
        let jsonData = json.data(using: .utf8)!
        let catWorkerData = try JSONDecoder().decode(CatWorkerData.self, from: jsonData)

        XCTAssertEqual(catWorkerData.id, "WRTVSzq2kNuOLPYn")
        XCTAssertEqual(catWorkerData.tags, ["Black"])
    }

    func testDecodingMissingIDKey() {
        let json =
        """
        {
            "tags": ["Black"]
        }
        """
        let jsonData = json.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(CatWorkerData.self, from: jsonData))
    }

    func testDecodingInvalidTagsType() {
        let json =
        """
        {
            "_id": "WRTVSzq2kNuOLPYn",
            "tags": "Black"
        }
        """
        let jsonData = json.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(CatWorkerData.self, from: jsonData))
    }
}
