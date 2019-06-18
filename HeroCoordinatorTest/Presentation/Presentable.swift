//
//  Presentable.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 04/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import Hero

protocol Presentable {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
    func preparePresentation(with context: PresentationContext)
}

typealias PresentableVC = UIViewController & Presentable

class PresentableViewController<VM>: PresentableVC {

    var panGR: UIPanGestureRecognizer!
    var viewModel: VM!
    
    override func viewDidLoad() {
        hero.isEnabled = true
        
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)

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
    
    @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began:
            // begin the transition as normal
            hero.dismissViewController()
        case .changed:
            Hero.shared.update(progress)
        default:
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
}

