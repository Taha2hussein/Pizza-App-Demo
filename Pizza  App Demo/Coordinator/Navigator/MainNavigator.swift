//
//  MainNavigator.swift
//  PizzaWorld
//
//  Created by Osama on 10/15/20.
//

import Foundation
import UIKit
class MainNavigator: Navigator {
    var coordinator: Coordinator
    
    enum Destination {
        case HomeViewController
        case itemDetails(product: Product)
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: Coordinator) -> UIViewController {
        switch destination {
        case .HomeViewController:
            let homeRepo = HomeRepo()
            let homeUseCase = HomeUseCase(homeRepo: homeRepo)
            let viewModel = HomeViewModel(homeUseCase: homeUseCase)
            let view = HomeViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        case .itemDetails(let product):
//            let viewModel = ItemDetailsViewModel(product: product)
//            let view = ItemDetailsViewController(viewModel: viewModel, coordinator: coordinator)
            return UIViewController()
        }
    }
}
