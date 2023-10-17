//
//  ViewController.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

final class MainViewController: BaseViewController<MainView> {
    
    private var viewModel: MainViewModelProtocol
    var router: MainSceneRouter?
    
    init(mainView: MainView, viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(mainView: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        setHandlers()
        viewModel.viewDidLoad()
    }
    
    private func setHandlers() {
    
        viewModel.updateMainScreenWeatherViewData = { [weak self] weatherData in
            self?.mainView.updateWeatherViewData(weatherData: weatherData)
        }
        
        viewModel.pushWeatherData = { [weak self] currentWeatehrUIModel in
            self?.router?.pushToWeatherScreen(weatherUIModel: currentWeatehrUIModel)
        }
        
        viewModel.displayError = { [weak self] errorMessage in
            self?.router?.showAlert(message: errorMessage)
        }
    }
}

extension MainViewController: SendLocationDataDelegate {
    func sendData(city: String) {
        viewModel.cityUpdated(city: city)
    }
}

