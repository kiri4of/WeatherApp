//
//  MainView.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit
import SnapKit

protocol SendLocationDataDelegate: AnyObject {
    func sendData(city: String)
}

class MainView: UIView {
    private let checkWeatherButton = CustomButton(title: NSLocalizedString("weatherButton", comment: "Check weather"), bg: .black)
    private let textField = UITextField(placeholder: NSLocalizedString("locationTextField", comment: "Location"))
    private let infoLabel = UILabel(text: NSLocalizedString("infoLabel", comment: "Enter location"), size: 46)
    private let stackView = UIStackView()
    private let customWeatherView = CustomWeatherView()
    
    weak var delegate: SendLocationDataDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWeatherViewData(weatherData: CurrentWeatherAPIEnum.CurrentWeatherUIModel) {
        customWeatherView.isHidden = false
        customWeatherView.setWeatherData(weatherData: weatherData)
    }
}

extension MainView {
    private func setupViews() {
        addSubview(stackView)
        addSubview(checkWeatherButton)
        addSubview(customWeatherView)
        
        stackView.addArrangedSubviews(infoLabel,textField)
        
        customWeatherView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(80)
            make.bottom.equalTo(infoLabel.snp.top).offset(-30)
        }
        
        //Label
        
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        //TextField
        textField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 300, height: 40))
        }
        //Button
        checkWeatherButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 250, height: 50))
            make.bottom.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
        }
        //StackView
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        configureUI()
        
    }
    
   private func configureUI() {
        customWeatherView.isHidden = true //will only work once, then it will be visible when you update the weather data
        backgroundColor = UIColor(patternImage: UIImage(named: "blackGradient")!)
        //StackView
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        
        //Label
        infoLabel.makeOutLine(oulineColor: .white, foregroundColor: .black)
        
        //TextField
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        //Button
        checkWeatherButton.isEnabled = false
        checkWeatherButton.alpha = 0.5
        checkWeatherButton.addTarget(self, action: #selector(didTapCheckWeatherButton), for: .touchUpInside)
    }
    
    
    
    //MARK: - Objc func
    @objc private func didTapCheckWeatherButton(){
        guard let cityString = textField.text else { return }
        delegate?.sendData(city: cityString)
    }
    
    @objc private func textFieldDidChange() {
        guard let text = textField.text else {return}
        let condition = text == ""
        checkWeatherButton.isEnabled = !condition
        checkWeatherButton.alpha = condition ? 0.5 : 1
    }
    
}

