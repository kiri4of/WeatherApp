//
//  TextField + Extension.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.backgroundColor = UIColor.systemGray6
        self.layer.cornerRadius = 5
        self.font = UIFont.systemFont(ofSize: 22)
    }
}

