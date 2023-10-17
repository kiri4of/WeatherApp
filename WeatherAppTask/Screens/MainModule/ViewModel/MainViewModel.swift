//
//  MainViewModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var pushWeatherData: ((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)? { get set }
    var updateMainScreenWeatherViewData: ((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)? {get set}
    var displayError: ((String) -> Void)? { get set }
    func cityUpdated(city: String)
    func viewDidLoad()
}

final class MainViewModel: MainViewModelProtocol {
    
    typealias ModelFromRequest = APIResult<WeatherDataAPIModel>
    var updateMainScreenWeatherViewData: ((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)? //update
    var pushWeatherData: ((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)? //for push
    var displayError: ((String) -> Void)?
    private let network: APIManagerProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    
    init(network: APIManagerProtocol, userDefaultsManager: UserDefaultsManagerProtocol) {
        self.network = network
        self.userDefaultsManager = userDefaultsManager
    }
    //loads old data and updates
    func viewDidLoad() {
        updateCurrentState()
    }
    
    func updateCurrentState() {
        guard let data = loadWeatherData() else { return }
        updateMainScreenWeatherViewData?(data)
        getWeather(city: data.cityName) { [weak self] weatherUIModel in
            self?.updateMainScreenWeatherViewData?(weatherUIModel)
        }
    }
    
    func getWeather(city: String, completion: @escaping (CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void) {
        network.makeRequest(for: MainEndpoint.getCityWeather(city: city)) { [weak self] (result: ModelFromRequest) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                let uiModel = CurrentWeatherAPIEnum.CurrentWeatherUIModel(apiModel: response)
                self.saveWeatherData(uiModel)
                completion(uiModel)
            case .failure(let error):
                self.checkAPIError(apiError: error)
            }
        }
    }
    
    
    func cityUpdated(city: String) {
        getWeather(city: city) { [weak self] weatherUIModel in
            self?.pushWeatherData?(weatherUIModel)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.updateMainScreenWeatherViewData?(weatherUIModel)
            }
        }
    }
    
    func saveWeatherData(_ data: CurrentWeatherAPIEnum.CurrentWeatherUIModel) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            userDefaultsManager.setValue(encodedData, forKey: "weatherData")
        } catch {
            print(error)
        }
    }
    
    func checkAPIError(apiError: APIError) {
        displayError?(apiError.displayMessage)
    }
    
    func loadWeatherData() -> CurrentWeatherAPIEnum.CurrentWeatherUIModel? {
        if let encodedData: Data = userDefaultsManager.getValue(forKey: "weatherData") {
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(CurrentWeatherAPIEnum.CurrentWeatherUIModel.self, from: encodedData)
                return decodedData
            } catch {
                print(error)
                return nil
            }
        }
        return nil
    }
}
