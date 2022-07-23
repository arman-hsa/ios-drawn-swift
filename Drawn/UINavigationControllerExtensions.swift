//
//  UINavigationControllerExtensions.swift
//  Drawn
//
//  Created by arman on 11/14/15.
//  Copyright © 2015 arman. All rights reserved.
//

import UIKit

extension UINavigationController {
    public override func shouldAutorotate() -> Bool {
        if visibleViewController is DrawingViewController {
            return (visibleViewController?.shouldAutorotate())!
        }
        return true
    }
}