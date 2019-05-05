//
//  Coordinator.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 02/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import Hero

protocol Coordinator {
    func start(in coordinator: Coordinator?)
}

class AnyCoordinator<VM, VC: PresentableViewController<VM>>: Coordinator {
    var presentableViewController: VC!
    
    func start(in coordinator: Coordinator?) {
        AppCoordinator.instance.rootViewController
            .pushViewController(presentableViewController, animated: true)
    }
    
    func makeViewModel() -> VM {
        fatalError("Not Implemented")
    }
    
    func makeViewController(viewModel: VM) -> VC {
        fatalError("Not Implemented")
    }
    
    func preparePresentation(with context: PresentationContext) {
        presentableViewController = makeViewController(viewModel: makeViewModel())
        
        presentableViewController
            .preparePresentation(with: context)
    }
    
    func present<VM, VC>(presentable: AnyCoordinator<VM, VC>, context: PresentationContext) where VC: PresentableViewController<VM> {
        
        presentable.preparePresentation(with: context)
        
        presentable.start(in: self)
    }
}
