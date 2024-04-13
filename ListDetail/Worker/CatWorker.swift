// CatWorker.swift

import Foundation

enum CatWorker {
    static let decoder = JSONDecoder()

    static let apiRoot = "https://cataas.com/api"

    static func fetchAllCatsData(limit: Int = 10) async throws -> [Data] {
        guard let url: URL = .init(string: "\(apiRoot)/cats?limit=\(limit)") else {
            throw APIError.invalidURL
        }

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            return try decoder.decode([Data].self, from: data)
        }
    }
}

extension CatWorker {
    struct Data: Decodable {
        let id: String
        let tags: [String]

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            tags = try container.decode([String].self, forKey: .tags)
        }

        private enum CodingKeys: String, CodingKey {
            case id = "_id"
            case tags
        }
    }
}

extension CatWorker {
    enum APIError: Error {
        case invalidURL
    }
}
