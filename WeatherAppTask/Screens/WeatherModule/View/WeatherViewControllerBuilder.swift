//
//  WeatherViewControllerBuilder.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import Foundation

class WeatherViewControllerBuilder {
    static func createWeatherViewController(weatherData: CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> WeatherViewContoller {
        let view = WeatherView()
        let userDefaultsManager = UserDefaultsManager()
        let viewModel = WeatherViewModel(userDefaultsManager: userDefaultsManager, weatherDataModel: weatherData)
        let vc = WeatherViewContoller(mainView: view, viewModel: viewModel)
        return vc
    }
}
