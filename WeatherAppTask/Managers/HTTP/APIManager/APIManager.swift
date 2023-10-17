//
//  APIManager.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 09.10.2023.
//

import Foundation

protocol APIManagerProtocol {
    func makeRequest<T: Decodable>(for endpoint: Endpoint, completion: @escaping (APIResult<T>) -> Void)
}

final class APIManger: APIManagerProtocol {
   private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func makeRequest<T: Decodable>(for endpoint: Endpoint, completion: @escaping (APIResult<T>) -> Void) {
        guard let request = endpoint.urlRequest else {
            completion(.failure(APIError.networkError(message: NSLocalizedString("requestError", comment: "Request error"))))
            return
        }
        networkManager.sendRequest(request: request, completion: completion)
    }
}
