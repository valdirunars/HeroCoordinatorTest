//
//  AppCoordinator.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 02/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import RxSwift

final class AppCoordinator: AnyCoordinator<AppViewModel, AppController> {

    static let instance = AppCoordinator()
    
    let rootViewController: UINavigationController
    
    let disposeBag = DisposeBag()
    
    override init() {
        
        rootViewController = UINavigationController()
        rootViewController.hero.isEnabled = true
        super.init()
    }
    
    override func makeViewModel() -> AppViewModel {
        let vm = AppViewModel()
        
        vm.present
            .map { (OtherCoordinator(), $0) }
            .subscribe(onNext: self.present)
            .disposed(by: disposeBag)
        return vm
    }
    
    override func makeViewController(viewModel: AppViewModel) -> AppController {
        let appController = AppController()
        appController.viewModel = makeViewModel()
        return appController
    }
}
