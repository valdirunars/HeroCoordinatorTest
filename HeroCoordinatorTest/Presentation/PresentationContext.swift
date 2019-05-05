//
//  PresentationContext.swift
//  HeroCoordinatorTest
//
//  Created by Þorvaldur Rúnarsson on 04/05/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import Foundation

struct PresentationContext {
    
    let imageID: String?
    let titleID: String?
    let descriptionID: String?
    let backgroundID: String?
    
    static var empty: PresentationContext {
        return PresentationContext(imageID: nil,
                                   titleID: nil,
                                   descriptionID: nil,
                                   backgroundID: nil)
    }
    
    static func hero(imageID: String?,
                     titleID: String?,
                     descriptionID: String?,
                     backgroundID: String?) -> PresentationContext {
        return PresentationContext(imageID: imageID,
                                   titleID: titleID,
                                   descriptionID: descriptionID,
                                   backgroundID: backgroundID)
    }
}
