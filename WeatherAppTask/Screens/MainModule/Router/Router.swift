//
//  Router.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

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
        let ac = UIAlertController(title: NSLocalizedString("errorAlert", comment: "Error") , message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: NSLocalizedString("okAction", comment: "Оk"), style: .default))
        controller?.present(ac, animated: true)
    }
}
