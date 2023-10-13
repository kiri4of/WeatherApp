//
//  Router.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit
// только пуш по сути


final class MainSceneRouter {
    
    private weak var controller: MainViewController?
    
    init(controller: MainViewController? = nil) {
        self.controller = controller
    }
    
    func pushToWeatherScreen(weatherUIModel: CurrentWeatherAPIEnum.CurrentWeatherUIModel) {
        let weatherViewController = WeatherViewControllerBuilder.createWeatherViewController(weatherData: weatherUIModel)
        controller?.navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
    func showAlert(message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        controller?.present(ac, animated: true)
    }
}
