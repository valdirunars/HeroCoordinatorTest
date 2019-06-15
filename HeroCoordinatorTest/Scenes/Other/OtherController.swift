//
//  OtherController.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class OtherController: PresentableViewController<OtherViewModel> {

    var test: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func addSubviews() {
        test = UIView()
        test.backgroundColor = .red
        self.view.addSubview(test)
    }
    
    override func makeConstraints() {
        test.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(200)
        }
    }
    
    override func setupBindings() {
        
    }

    override func preparePresentation(with context: PresentationContext) {
        
        if let backgroundID = context.backgroundID {
            view.hero.isEnabled = true
            view.hero.id = backgroundID
        }
        
        if let imageID = context.imageID {
            test.hero.isEnabled = true
            test.hero.id = imageID
        }
    }
}
