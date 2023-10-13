//
//  CustomButton.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import UIKit

final class CustomButton: BaseButton {
    
    private var title: String
    private var bgColor: UIColor
    private var font = UIFont(name: "Apple SD Gothic Neo Bold", size: 22)
    
    init(title: String, bg: UIColor) {
        self.bgColor = bg
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cornerRadius = self.frame.height / 2
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        layer.shadowColor = bgColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10.0
    }
    
    func addBorder() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
    }
}
