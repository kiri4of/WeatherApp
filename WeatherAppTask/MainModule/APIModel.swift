//
//  APIModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation

struct CurrentWeaterAPIModel: Decodable {
    let temp_c: Double?
    let feelslike_c: Double?
    let humidity: Double?
    let pressure_mb: Double?
    let icon: String?
}

