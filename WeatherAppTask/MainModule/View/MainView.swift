//
//  MainView.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    private var checkWeatherButton = UIButton(title: "Check Weather", color: .brown, titleColor: .white, type: .system)
    private var textField = UITextField(placeholder: "Location")
    private var infoLabel = UILabel(size: 27, text: "Enter location")
    private var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        configureUI()
    }
}

extension MainView {
    func setupViews() {
        //StackView
        self.addSubview(stackView)
        self.addSubview(checkWeatherButton)
        self.backgroundColor = .white
        
        stackView.addArrangedSubviews(infoLabel,textField)
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        
        //Label
        infoLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 300, height: 50))
        }
        //TextField
        textField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 300, height: 40))
        }
        checkWeatherButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 250, height: 50))
            make.bottom.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
       
    }
    
    func configureUI() {
        checkWeatherButton.layer.cornerRadius = checkWeatherButton.frame.height / 2
        checkWeatherButton.layer.masksToBounds = true

    }
}


