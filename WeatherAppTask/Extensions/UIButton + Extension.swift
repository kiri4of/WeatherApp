//
//  UIButton + Extension.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

extension UIButton {
    convenience init(title: String, color: UIColor, titleColor: UIColor, type: ButtonType) {
        self.init(type: type)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 22)
    }
}
