//
//  MainEndpoint.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 09.10.2023.
//

import Foundation
import Alamofire

enum ApiKeyMain {
    static let key = "77f323f04ce1431aaa1234057230710"
}

enum MainEndpoint {
    case getCityWeather(city: String)
}

extension MainEndpoint: Endpoint {
    var baseURL: URL {
        return URL(string: "https://api.weatherapi.com")!
    }
    
    var path: String {
        switch self {
        case .getCityWeather:
            return "/v1/forecast.json"
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getCityWeather:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getCityWeather(let city):
            return ["key":"\(ApiKeyMain.key)", "q": city, "lang": NSLocalizedString("responseLanguage", comment: "en")]
        }
    }
    
    var encoding: Alamofire.ParameterEncoding {
        switch self {
        case .getCityWeather:
            return URLEncoding.default
        }
    }
    
}

