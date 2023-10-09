//
//  MainViewControllerBuilder.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import Foundation


final class MainViewControllerBuilder {
    public static func createMainViewController() -> MainViewController {
        let view = MainView()
        let router = Router()
        let viewModel = MainViewModel(router: router)
        let vc = MainViewController(mainView: view)
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
    
}
