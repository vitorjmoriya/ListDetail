// CatWorkerProtocol.swift

import Foundation

protocol CatWorkerProtocol {
    var apiRoot: String { get }

    func fetchAllCatsData(limit: Int) async throws -> [CatWorkerData]

    func getCatPhotoURL(id: String, width: Int?, height: Int?) throws -> URL
}

extension CatWorkerProtocol {
    var apiRoot: String { "https://cataas.com" }

    func getCatPhotoURL(id: String, width: Int? = nil, height: Int? = nil) throws -> URL {
        let baseURL = "\(apiRoot)/cat/\(id)"
        var parameters = [String]()

        if let width {
            parameters.append("width=\(width)")
        }

        if let height {
            parameters.append("height=\(height)")
        }

        let fullURL = parameters.isEmpty
            ? "\(baseURL)"
            : "\(baseURL)?\(parameters.joined(separator: "&"))"

        guard let url = URL(string: fullURL) else {
            throw APIError.invalidURL
        }

        return url
    }
}

enum APIError: Error {
    case invalidURL
}

struct CatWorkerData: Decodable {
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
