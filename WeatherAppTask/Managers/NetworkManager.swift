//
//  NetworkManager.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    case serverError(message: String)
    case networkError
}

enum APIResult<T> {
    case success(T)
    case failure(APIError)
}




protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(place: String, completion: @escaping (APIResult<T>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager(); private init() {}
    
    private func createURL(apiKey: String, place: String) -> String {
        let tunnel = "https://"
        let server = "api.weatherapi.com"
        let endpoint = "/v1"
        let getParams = "/forecast.json?key=\(apiKey)&q=\(place)"
        let url = tunnel + server + endpoint + getParams
        return url
    }
    
    func fetchData<T: Decodable>(place: String, completion: @escaping (APIResult<T>) -> Void) {
        AF.request(createURL(apiKey: "77f323f04ce1431aaa1234057230710", place: place))
            .validate()
            .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                debugPrint(error)
                let apiError = APIError.networkError
                completion(.failure(apiError))
            }
        }
        
    }
    
}



