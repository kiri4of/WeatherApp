//
//  EndPoint.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 09.10.2023.
//

import Foundation
import Alamofire

public typealias HTTPHeaders = [String:String]?

protocol Endpoint {
    var baseURL: URL {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var headers: HTTPHeaders {get}
    var parameters: [String: Any]? {get}
    var encoding: ParameterEncoding {get}
}

extension Endpoint {
    var urlRequest: URLRequest? {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        if let parameters = parameters {
            do {
                request = try encoding.encode(request, with: parameters)
            } catch {
                return nil
            }
        }
        return request
    }
}

