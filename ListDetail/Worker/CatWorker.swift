// CatWorker.swift

import Foundation

struct CatWorker: CatWorkerProtocol {
    static let decoder = JSONDecoder()

    func fetchAllCatsData(limit: Int) async throws -> [CatWorkerData] {
        guard let url: URL = .init(string: "\(apiRoot)/api/cats?limit=\(limit)") else {
            throw APIError.invalidURL
        }

        let request = URLRequest(url: url)

        let (data, _) = try await URLSession.shared.data(for: request)

        return try CatWorker.decoder.decode([CatWorkerData].self, from: data)
    }
}
