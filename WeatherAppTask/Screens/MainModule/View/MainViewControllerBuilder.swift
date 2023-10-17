//
//  MainViewControllerBuilder.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation


final class MainViewControllerBuilder {
     static func createMainViewController() -> MainViewController {
        let view = MainView()
        let network = APIManger()
        let userDefaultsManager = UserDefaultsManager()
        let viewModel = MainViewModel(network: network, userDefaultsManager: userDefaultsManager)
        let vc = MainViewController(mainView: view, viewModel: viewModel)
        let router = MainSceneRouter(controller: vc)
        vc.router = router
        return vc
    }
    
}
