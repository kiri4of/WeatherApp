//
//  WeatherView.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import UIKit
import SnapKit

class WeatherView: UIView {
    private let locationLabel = UILabel(size: 30, font: "Apple SD Gothic Neo")
    private let temperatureLabel = UILabel(size: 76)
    private let pressureLabel = UILabel(size: 22)
    private let humidityLabel = UILabel(size: 22)
    private let windLabel = UILabel(size: 22)
    private let weatherCondtionLabel = UILabel(size: 26)
    
    private let pressureImageView = UIImageView()
    private let humidityImageView = UIImageView()
    private let windImageView = UIImageView()
    
    private let generalStackView = UIStackView()
    private let humidityStackView = UIStackView()
    private let pressureStackView = UIStackView()
    private let windStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWeatherData(weatherData: CurrentWeatherAPIEnum.CurrentWeatherUIModel) {
        locationLabel.text = "\(weatherData.cityName), \(weatherData.countryName)"
        temperatureLabel.text = "\(Int(weatherData.temperature))˚C"
        pressureLabel.text = "\(weatherData.pressure) mm"
        windLabel.text = "\(weatherData.wind_mph) mph"
        humidityLabel.text = "\(weatherData.humidity) %"
        weatherCondtionLabel.text = "\(weatherData.weatherCondtion)"
    }
    
}

extension WeatherView {
    private func setupViews() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "GradientWallpaper3")!)
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        addSubview(generalStackView)
        addSubview(weatherCondtionLabel)
        generalStackView.addArrangedSubviews(humidityStackView,pressureStackView,windStackView)
        humidityStackView.addArrangedSubviews(humidityImageView,humidityLabel)
        pressureStackView.addArrangedSubviews(pressureImageView,pressureLabel)
        windStackView.addArrangedSubviews(windImageView,windLabel)
        
        weatherCondtionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(temperatureLabel.snp.top)
            make.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100) 
        }
        
        generalStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(temperatureLabel.snp.bottom).offset(60)
        }
        
        humidityImageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
        pressureImageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
        windImageView.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(generalStackView.snp.bottom).offset(20)
        }
        
        
        configureUI()
    }
    
    private func configureUI() {
        //ImageViews
        humidityImageView.image = UIImage(systemName: "humidity")
        humidityImageView.tintColor = .white
        pressureImageView.image = UIImage(systemName: "icloud.and.arrow.up")
        pressureImageView.tintColor = .white
        windImageView.image = UIImage(systemName: "wind")
        windImageView.tintColor = .white
        
        //stackViews
        generalStackView.axis = .horizontal
        generalStackView.alignment = .fill
        generalStackView.distribution = .fillEqually
        generalStackView.spacing = 5
        
        humidityStackView.axis = .vertical
        humidityStackView.alignment = .center
        humidityStackView.distribution = .fillEqually
        humidityStackView.spacing = 5
        
        pressureStackView.axis = .vertical
        pressureStackView.alignment = .center
        pressureStackView.distribution = .fillEqually
        pressureStackView.spacing = 5
        
        windStackView.axis = .vertical
        windStackView.alignment = .center
        windStackView.distribution = .fillEqually
        windStackView.spacing = 5
    }
    
}


