//
//  AppController.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 03/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Hero

class AppController: PresentableViewController<AppViewModel> {

    let presentationContext: PresentationContext = .hero(imageID: "test",
                                                         titleID: nil,
                                                         descriptionID: nil,
                                                         backgroundID: "background")
    let test: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .purple
        
        button.hero.isEnabled = true
        button.hero.id = "test"
        return button
    }()

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        self.title = "Hero Test"
        self.view.backgroundColor = .cyan
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func addSubviews() {
        view.hero.isEnabled = true
        view.hero.id = "background"
        
        self.view.addSubview(test)
    }
    
    override func makeConstraints() {
        test.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview().offset(-100)
        }
    }
    
    override func setupBindings() {
        test.rx.tap
            .map { [unowned self] in
                .hero(imageID: self.test.hero.id,
                      titleID: nil,
                      descriptionID: nil,
                      backgroundID: self.view.hero.id)
            }
            .subscribe(viewModel.present)
            .disposed(by: disposeBag)
    }

    override func preparePresentation(with context: PresentationContext) {
        if let backgroundID = context.backgroundID {
            view.hero.id = backgroundID
        }
        
        if let imageID = context.backgroundID {
            test.hero.id = imageID
        }
    }
    
}
