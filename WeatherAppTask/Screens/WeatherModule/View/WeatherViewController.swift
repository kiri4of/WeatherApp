//
//  WeatherViewController.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import UIKit

class WeatherViewContoller: BaseViewController<WeatherView> {
    
    private var viewModel: WeatherViewModelProtocol
    
    init(mainView: WeatherView, viewModel: WeatherViewModelProtocol) {
        self.viewModel = viewModel
        super.init(mainView: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setHandlers()
        viewModel.viewDidLoad()
    }
    
    func setHandlers() {
        viewModel.updateWeatherScreenViewData = { [weak self] weatherData in
            self?.mainView.setWeatherData(weatherData: weatherData)
        }
    }
}


