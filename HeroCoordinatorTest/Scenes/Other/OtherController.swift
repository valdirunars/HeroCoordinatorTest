//
//  OtherController.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import SnapKit

class OtherController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.hero.id = "background"

        let test = UIView()
        test.backgroundColor = .red
        self.view.addSubview(test)

        test.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        test.hero.isEnabled = true
        test.hero.id = "test"
        
    }

}
