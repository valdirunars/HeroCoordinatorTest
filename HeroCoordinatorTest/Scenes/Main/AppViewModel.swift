//
//  AppViewModel.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 04/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import RxSwift

struct AppViewModel {
    let present = PublishSubject<PresentationContext>()
}
