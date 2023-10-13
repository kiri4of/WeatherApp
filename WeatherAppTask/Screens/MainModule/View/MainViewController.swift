//
//  ViewController.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

final class MainViewController: BaseViewController<MainView> {
    
    private var viewModel: MainViewModelProtocol!
    var router: MainSceneRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.delegate = self
    }
    
    func updateView() {
        viewModel.updateViewData = { [weak self] response in
            print(response)
            switch response {
            case .success(let currentWeatherAPImodel):
                let currentWeatherUI = CurrentWeatherAPIEnum.CurrentWeatherUIModel(apiModel: currentWeatherAPImodel)
                self?.router?.pushToWeatherScreen(weatherUIModel: currentWeatherUI)
            case .failure(let errorMessage):
                self?.router?.showAlert(message: errorMessage)
            }
        }
    }
    
}

extension MainViewController: SendLocationDataDelegate {
    func sendData(city: String) {
        viewModel.getWeather(with: city)
        updateView()
    }
    
    
}

extension MainViewController {
    func setViewModel(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
    }
}

