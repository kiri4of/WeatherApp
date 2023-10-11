//
//  UIModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

enum CurrentWeatherAPIEnum {
    case success(WeatherDataAPIModel)
    case failure(String)
    
    struct CurrentWeatherUIModel {
        let temperatureString: Double
        let appearentTemperatureString: Double
        let humidityString: Int
        let pressureString: Double

        init(apiModel: WeatherDataAPIModel) {
        self.temperatureString = apiModel.current.temp_c ?? 0.0
        self.appearentTemperatureString = apiModel.current.feelslike_c ?? 0.0
        self.humidityString = apiModel.current.humidity ?? 0
        self.pressureString = apiModel.current.pressure_mb ?? 0.0
        }
    }
}
