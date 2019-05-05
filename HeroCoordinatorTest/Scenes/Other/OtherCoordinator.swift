//
//  OtherCoordinator.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import Hero

final class OtherCoordinator: AnyCoordinator<OtherViewModel, OtherController> {
    
    override func makeViewModel() -> OtherViewModel {
        return OtherViewModel()
    }
    
    override func makeViewController(viewModel: OtherViewModel) -> OtherController {
        return OtherController()
    }
}
