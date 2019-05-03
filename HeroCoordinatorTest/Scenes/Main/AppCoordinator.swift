//
//  AppCoordinator.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 02/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate {
    func trigger()
}

final class AppCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    
    init(in window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.hero.isEnabled = true
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let emptyViewController = AppController()
        emptyViewController.delegate = self
        (window.rootViewController as! UINavigationController)
            .pushViewController(emptyViewController, animated: false)
    }
    
    
}

extension AppCoordinator: AppCoordinatorDelegate {
    func trigger() {
        let other = OtherCoordinator(presenter: rootViewController, viewController: OtherController())
        other.start()
    }
}
