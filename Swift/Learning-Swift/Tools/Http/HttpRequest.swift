//
//  HttpRequest.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/11/29.
//

import Foundation
import Alamofire

class HttpRequest {
    
    static func postRequest<T: Decodable>(path: String, paramter: [String: Any]?) async throws -> T {
        do {
            let headers = HTTPHeaders(HttpConfig.default.getHttpHeader())
            return try await AF.request(path, method: .post, parameters: paramter, headers: headers)
                .serializingDecodable(T.self)
                .value
        } catch {
            throw error
        }
    }
    
    static func getRequest<T: Decodable>(path: String, paramter: [String: Any]?) async throws -> T {
        do {
            let headers = HTTPHeaders(HttpConfig.default.getHttpHeader())
            return try await AF.request(path, method: .get, parameters: paramter, headers: headers)
                .serializingDecodable(T.self)
                .value
        } catch {
            throw error
        }
    }
}
