//
//  BaseButton.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import UIKit

class BaseButton: UIButton {
    
    override var isHighlighted: Bool {
        get { return super.isHighlighted }
        set {
            guard newValue != isHighlighted else { return }
            
            if newValue == true {
                titleLabel?.alpha = 0.25
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel?.alpha = 1
                }
                super.isHighlighted = newValue
            }
            super.isHighlighted = newValue
        }
    }
}
