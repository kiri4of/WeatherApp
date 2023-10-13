//
//  WeatherViewController.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 12.10.2023.
//

import UIKit

class WeatherViewContoller: BaseViewController<WeatherView> {
    
    private var viewModel: WeatherViewModelProtocol!
    
    override func viewDidLoad() {
        
    }
    
}

extension WeatherViewContoller {
    func setViewModel(viewModel: WeatherViewModelProtocol) {
        self.viewModel = viewModel
    }
}

