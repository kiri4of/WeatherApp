//
//  APIModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

struct WeatherDataAPIModel: Decodable {
    let current: Current
}

struct Current: Decodable {
    let humidity: Int?
    let pressure_mb: Double?
    let temp_c: Double?
    let feelslike_c: Double?
}



