//
//  UIModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

struct CurrentWeaterUIModel {
    let temperatureString: Double
    let appearentTemperatureString: Double
    let humidityString: Double
    let pressureString: Double
    let icon: UIImage?
    
    init(apiModel: CurrentWeaterAPIModel) {
        self.temperatureString = apiModel.temp_c ?? 0.0
        self.appearentTemperatureString = apiModel.feelslike_c ?? 0.0
        self.humidityString = apiModel.humidity ?? 0.0
        self.pressureString = apiModel.pressure_mb ?? 0.0
        self.icon = WeatherIconManager(rawValue: apiModel.icon ?? "").image
    }
}
