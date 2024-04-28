//  CatWorkerJSON.swift

import Foundation

struct CatWorkerJSON: CatWorkerProtocol {
    static let decoder = JSONDecoder()

    func fetchAllCatsData(limit: Int) async throws -> [CatWorkerData] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            throw APIError.invalidURL
        }

        let data = try Data(contentsOf: url)

        return try CatWorkerJSON.decoder.decode([CatWorkerData].self, from: data)
    }
}
