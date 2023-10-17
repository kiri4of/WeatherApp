//
//  WeatherViewModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import Foundation

protocol WeatherViewModelProtocol {
    var updateWeatherScreenViewData:((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)? {get set}
    func viewDidLoad()
}

class WeatherViewModel: WeatherViewModelProtocol {
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private var weatherDataModel: CurrentWeatherAPIEnum.CurrentWeatherUIModel
    var updateWeatherScreenViewData: ((CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> Void)?
    
    init(userDefaultsManager: UserDefaultsManager, weatherDataModel: CurrentWeatherAPIEnum.CurrentWeatherUIModel) {
        self.userDefaultsManager = userDefaultsManager
        self.weatherDataModel = weatherDataModel
    }
    
    func viewDidLoad() {
        updateUI()
    }
    
    func updateUI() {
        updateWeatherScreenViewData?(weatherDataModel)
    }
    
}
