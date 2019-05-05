//
//  Presentable.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 04/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit

protocol Presentable {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
    func preparePresentation(with context: PresentationContext)
}

typealias PresentableVC = UIViewController & Presentable

class PresentableViewController<VM>: PresentableVC {

    var viewModel: VM!
    
    override func viewDidLoad() {
        self.hero.isEnabled = true

        addSubviews()
        makeConstraints()
        setupBindings()
        
        super.viewDidLoad()
    }
    
    func preparePresentation(with context: PresentationContext) {
        fatalError("Not Implemented")
    }
    
    func addSubviews() {
        fatalError("Not Implemented")
    }
    
    func makeConstraints() {
        fatalError("Not Implemented")
    }
    
    func setupBindings() {
        fatalError("Not Implemented")
    }
}

