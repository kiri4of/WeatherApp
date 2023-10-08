//
//  UILabel + Extension.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

extension UILabel {
    convenience init(size: CGFloat, text: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: size)
        self.text = text
        self.textAlignment = .center
    }
}

