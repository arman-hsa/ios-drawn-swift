//
//  MathHelper.swift
//  Drawn
//
//  Created by arman on 11/18/15.
//  Copyright © 2015 arman. All rights reserved.
//

import Foundation

func scale(x:Float, minStart:Float, minEnd:Float, maxStart:Float, maxEnd:Float) -> Float {
    return ((x - minStart) / (minEnd - minStart)) * (maxEnd - maxStart) + maxStart
}