//
//  WeatherViewControllerBuilder.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import Foundation

class WeatherViewControllerBuilder {
    static func createWeatherViewController(weatherData: CurrentWeatherAPIEnum.CurrentWeatherUIModel) -> WeatherViewContoller {
        let view = WeatherView(weatherData: weatherData)
        let viewModel = WeatherViewModel()
        let vc = WeatherViewContoller(mainView: view)
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
}
