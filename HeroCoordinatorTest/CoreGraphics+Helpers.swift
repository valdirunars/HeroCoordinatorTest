//
//  CoreGraphics+Helpers.swift
//  HeroCoordinatorTest
//
//  Created by Thorvaldur Runarsson on 15/06/2019.
//  Copyright © 2019 Thorvaldur. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    // define a small helper function to add two CGPoints
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
}
