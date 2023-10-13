//
//  MainViewModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((CurrentWeatherAPIEnum) -> Void)? { get set }
    func getWeather(with city: String)
}

final class MainViewModel: MainViewModelProtocol {
    typealias ModelFromRequest = APIResult<WeatherDataAPIModel>
    
    var updateViewData: ((CurrentWeatherAPIEnum) -> Void)?
    private let network: APIManagerProtocol
    
    init(network: APIManagerProtocol) {
        self.network = network
    }
    
    func getWeather(with city: String) {
        network.makeRequest(for: MainEndpoint.getCityWeather(city: city, lang: NSLocalizedString("responseLanguage", comment: "en"))) { [weak self] (result: ModelFromRequest) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.updateViewData?(.success(response))
            case .failure(let error):
                self.checkAPIError(apiError: error)
            }
        }
    }
    
    func checkAPIError(apiError: APIError) {
        switch apiError {
        case .clientError(_): // let message - is correct but in this case we always get when city is incorrect
            self.updateViewData?(.failure("City not found")) // When city incorrect
        case .serverError(let message):
            self.updateViewData?(.failure(message))
        case .unknownError(let message):
            self.updateViewData?(.failure(message))
        case .networkError(let message):
            self.updateViewData?(.failure(message))
        }
    }
    
}
