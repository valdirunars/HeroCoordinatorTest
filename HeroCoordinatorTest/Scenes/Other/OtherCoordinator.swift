//
//  OtherCoordinator.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import Hero

final class OtherCoordinator: Coordinator {
    let presenter: UINavigationController
    let viewController: UIViewController
    
    init(presenter: UINavigationController, viewController: UIViewController) {
        self.presenter = presenter
        self.viewController = viewController
    }
    
    func start() {
        presenter.pushViewController(viewController, animated: true)
    }
}
