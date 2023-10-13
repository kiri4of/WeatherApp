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
    
    struct CurrentWeatherUIModel: Encodable {
        let temperature: Double
        let humidity: Int
        let pressure: Double
        let wind_mph: Double
        let cityName: String
        let countryName: String
        let weatherCondtion: String
        
        init(apiModel: WeatherDataAPIModel) {
        self.temperature = apiModel.current.temp_c ?? 0.0
        self.humidity = apiModel.current.humidity ?? 0
        self.pressure = apiModel.current.pressure_mb ?? 0.0
        self.wind_mph = apiModel.current.wind_mph ?? 0.0
        self.cityName = apiModel.location.name ?? ""
        self.countryName = apiModel.location.country ?? ""
        self.weatherCondtion = apiModel.current.condition.text ?? ""
        }
    }
}
