//
//  APIModel.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

struct WeatherDataAPIModel: Decodable {
    let current: Current
    let location: Location
}

struct Current: Decodable {
    let humidity: Int?
    let pressure_mb: Double?
    let temp_c: Double?
    let wind_mph: Double?
    let condition: Condition
}

struct Location: Decodable {
    let name: String?
    let country: String?
}

struct Condition: Decodable {
    let text: String?
}

