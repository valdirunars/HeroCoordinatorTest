//
//  AppController.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class AppController: UIViewController {
    
    var delegate: AppCoordinatorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hero Test"
        self.view.hero.id = "background"
        self.view.backgroundColor = .cyan

        let view = UIView()
        view.backgroundColor = .purple
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        
        view.hero.isEnabled = true
        view.hero.id = "test"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.delegate.trigger()
        }
    }

}
