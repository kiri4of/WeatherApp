//
//  ViewController.swift
//  WeatherAppTask
//
//  Created by Kiri4of on 08.10.2023.
//

import UIKit

final class MainViewController: BaseViewController<MainView> {
    
    private var viewModel: MainViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

extension MainViewController {
    func setViewModel(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
    }
}
