//
//  Layer.swift
//  Drawn
//
//  Created by Aaron Sky on 11/9/15.
//  Copyright © 2015 Aaron Sky. All rights reserved.
//

import UIKit

class Layer : NSObject, NSCoding {
    lazy var strokes : [Stroke] = [Stroke]()
    var strokeIndex : Int = 0
    
    override init() {
        print("Layer - \(__FUNCTION__) called")
        super.init()
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        print("Layer - \(__FUNCTION__) called")
        super.init()
        strokes = aDecoder.decodeObjectForKey("strokes") as! [Stroke]
        strokeIndex = strokes.count
        LayerEnum.initWithCoder(aDecoder)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(strokes, forKey: "strokes")
        LayerEnum.encodeWithCoder(aCoder)
    }
    
    func empty() -> Bool {
        if strokes.count > 0 {
            for stroke in strokes {
                if stroke.points.count > 0 {
                    return true
                }
            }
        }
        return false
    }
    
    func clear() {
        for stroke in strokes {
            stroke.points.removeAll()
        }
    }
    
    func strokeTo(point: CGPoint, withOptions options: DrawingOptions) {
        if strokeIndex >= strokes.count {
            let stroke = Stroke(point: point, withOptions: options.copy() as! DrawingOptions)
            strokes.append(stroke)
        } else {
            strokes[strokeIndex].strokeTo(point, withOptions: options.copy() as! DrawingOptions)
        }
    }
    
    func finishStroke() {
        strokeIndex++
    }
    
    func popLast() -> Stroke? {
        if let stroke = strokes.popLast() {
            strokeIndex--;
            return stroke
        }
        return nil
    }
}