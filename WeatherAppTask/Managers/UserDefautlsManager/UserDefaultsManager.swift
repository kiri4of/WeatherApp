//
//  UserDefaultsManager.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 13.10.2023.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func setValue<T>(_ value: T, forKey key: String)
    func getValue<T>(forKey key: String) -> T?
    func removeValue(forKey key: String)
    func hasValue(forKey key: String) -> Bool
}

class UserDefaultsManager: UserDefaultsManagerProtocol  {
    private let userDefaults = UserDefaults.standard

    func setValue<T>(_ value: T, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    func getValue<T>(forKey key: String) -> T? {
        return userDefaults.value(forKey: key) as? T
    }

    func removeValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    func hasValue(forKey key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
    
    enum UserDefaultsKeys: String {
        case weatherData
    }
}





