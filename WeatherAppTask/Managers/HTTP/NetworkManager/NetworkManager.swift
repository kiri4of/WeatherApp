//
//  NetworkManager.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    case clientError(String)
    case serverError(String)
    case unknownError(String)
    case networkError(message: String) 
}

enum APIResult<T> {
    case success(T)
    case failure(APIError)
}

protocol NetworkManagerProtocol {
    func sendRequest<T: Decodable>(request: URLRequestConvertible, completion: @escaping (APIResult<T>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func sendRequest<T: Decodable>(request: URLRequestConvertible, completion: @escaping (APIResult<T>) -> Void) {
        AF.request(request)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value): //json
                    completion(.success(value))
                case .failure(let error):
                    if let statusCode = response.response?.statusCode {
                        if let error = self.processStatusCode(statusCode) {
                            completion(.failure(error))
                        } else {
                            completion(.failure(APIError.unknownError(error.localizedDescription)))
                        }
                    } else {
                        completion(.failure(APIError.unknownError("Status Code is not available")))
                    }
                }
            }
    }
}

extension NetworkManager {
    private func processStatusCode(_ statusCode: Int) -> APIError? {
        switch statusCode {
        case 200..<300: // Range of successful statuses
            return nil
        case 400..<500: // Range of client errors
            return .clientError("Client Error: \(statusCode)")
        case 500..<600: // Server Error Range
            return .serverError("Server Error: \(statusCode)")
        default: // Another statuses
            return .unknownError("Unknown Error: \(statusCode)")
        }
    }
}

extension APIError {
    var displayMessage: String {
        switch self {
        case .clientError(_): // let message - is correct but in this case we always get when city is incorrect
            return NSLocalizedString("cityNotFound", comment: "City not found") // When city incorrect //тут локу подправить
        case .serverError(let message):
            return message
        case .unknownError(let message):
            return message
        case .networkError(let message):
            return message
        }
    }
}
