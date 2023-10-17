//
//  UILabel + Extension.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, size: CGFloat) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = UIFont(name: "Apple SD Gothic Neo Bold", size: size)
        self.text = text
        self.textAlignment = .center
    }
    
    convenience init(size: CGFloat, font: String? = "Apple SD Gothic Neo Bold") {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
        self.font = UIFont(name: font!, size: size)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : oulineColor,
            NSAttributedString.Key.foregroundColor : foregroundColor,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : font ?? UIFont.systemFontSize
        ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                             value: NSUnderlineStyle.single.rawValue,
                                             range: NSRange(location: 0,
                                             length: attributedString.length))
            attributedText = attributedString
        }
    }
    
}





