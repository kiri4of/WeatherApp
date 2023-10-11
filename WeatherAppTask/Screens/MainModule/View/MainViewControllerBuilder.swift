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
        let viewModel = MainViewModel(network: network)
        let vc = MainViewController(mainView: view)
        let router = MainSceneRouter(controller: vc)
        vc.router = router
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
    
}
