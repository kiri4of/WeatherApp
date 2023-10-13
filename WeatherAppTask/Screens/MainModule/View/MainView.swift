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
    private let checkWeatherButton = CustomButton(title: NSLocalizedString("weatherButton", comment: "Check weather"), bg: .brown)
    private let textField = UITextField(placeholder: NSLocalizedString("locationTextField", comment: "Location"))
    private let infoLabel = UILabel(text: NSLocalizedString("infoLabel", comment: "Enter location"), size: 46)
    private let stackView = UIStackView()
    
    weak var delegate: SendLocationDataDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
}

extension MainView {
    func setupViews() {
        self.addSubview(stackView)
        self.addSubview(checkWeatherButton)
        stackView.addArrangedSubviews(infoLabel,textField)
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
    
    func configureUI() {
        backgroundColor = UIColor(patternImage: UIImage(named: "Wallpaper3")!)
        //StackView
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        
        //Label
        infoLabel.makeOutLine(oulineColor: .brown, foregroundColor: .white)
        
        //TextField
       // textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        //Button
        checkWeatherButton.isEnabled = false
        checkWeatherButton.alpha = 0.5
        checkWeatherButton.addTarget(self, action: #selector(didTapCheckWeatherButton), for: .touchUpInside)
    }
    
    //MARK: - Objc func
    @objc func didTapCheckWeatherButton(){
        guard let cityString = textField.text else { return }
        delegate?.sendData(city: cityString)
    }
    
    @objc func textFieldDidChange() {
        if let text = textField.text, text == "" {
            checkWeatherButton.isEnabled = false
            checkWeatherButton.alpha = 0.5
        } else {
            checkWeatherButton.isEnabled = true
            checkWeatherButton.alpha = 1
        }
    }
    
}

