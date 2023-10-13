//
//  UserDefaultsManager.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 13.10.2023.
//

import Foundation
protocol UserDefaultsManagerProtocol {
    func setValue(_ value: Any, forKey key: String)
    func getValue(forKey key: String) -> Any?
    func removeValue(forKey key: String)
    func hasValue(forKey key: String) -> Bool
}

class UserDefaultsManager: UserDefaultsManagerProtocol  {
    static let shared = UserDefaultsManager()

    private let userDefaults = UserDefaults.standard

    func setValue(_ value: Any, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    func getValue(forKey key: String) -> Any? {
        return userDefaults.value(forKey: key)
    }

    func removeValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }

    func hasValue(forKey key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
}

