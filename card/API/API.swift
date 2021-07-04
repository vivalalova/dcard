//
//  API.swift
//  card
//
//  Created by Lova on 2020/7/21.
//

import Combine
import FetchSwift
import Foundation

final class DCardAPI: Fetch, ObservableObject {
    var domain: String = "https://www.dcard.tw/service/api/v2/"

    var decoder: JSONDecoder = JSONDecoder()

    var encoder: JSONEncoder = JSONEncoder()

    static let shared = DCardAPI()

    func willSend(params: [String: Any], method: FetchSwift.Method, path: String) -> Params {
        params
    }

    func willSend(request: URLRequest, method: FetchSwift.Method, path: String, params: [String: Any]) -> URLRequest {
        request
    }

    func show(progress: Float?) {}

    func hide(progress: Float?) {}

    static let board = "apple"
}

extension DCardAPI {
    func forum() -> Response<[Board]> {
        self.fetch(path: "forums")
    }

    func featured(lastId: Int?) -> Response<[Post]> {
        var param: [String: Any] = [:]
        if let lastId = lastId {
            param["before"] = lastId
        }

        return self.fetch(path: "forums/\(DCardAPI.board)/featuredPosts", params: param)
    }

    func posts(lastId: Int?) -> Response<[Post]> {
        var param: [String: Any] = [:]
        if let lastId = lastId {
            param["before"] = lastId
        }

        return self.fetch(path: "forums/\(DCardAPI.board)/posts", params: param)
    }

    func post(id: Int) -> Response<Post?> {
        self.fetch(path: "posts/\(id)")
    }

    func comments(id: Int, offset: Int?) -> Response<[Comment]> {
        var param: [String: Any] = [:]
        if let offset = offset {
            param["after"] = offset
        }

        return self.fetch(path: "posts/\(id)/comments", params: param)
    }
}
