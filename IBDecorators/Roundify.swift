//
//  Roundify.swift
//  IBDecorators
//
//  Created by Robert Kaleciński on 14.11.2017.
//  Copyright © 2017 Robert Kaleciński. All rights reserved.
//

import UIKit

public class Roundify : NSObject {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 30
    
    @IBInspectable
    public var roundifyToHalfCircle: Bool = false
    
    @IBOutlet
    public var views: [UIView]? {
        didSet {
            Roundify.apply(
                on: views,
                toHalfCirle: roundifyToHalfCircle,
                cornerRadius: cornerRadius
            )
        }
    }
    
    static func apply(on views: [UIView]?, toHalfCirle: Bool, cornerRadius: CGFloat) {
        guard let views = views else { return }
        
        views.forEach { (view) in
            view.layer.cornerRadius = toHalfCirle
                ? view.frame.size.height / 2
                : cornerRadius
            view.clipsToBounds = true
        }
    }
    
    public static func toHalfCircle(on views: [UIView]?) {
        Roundify.apply(on: views, toHalfCirle: true, cornerRadius: 0)
    }
    
    public static func apply(cornerRadius : CGFloat, on views: [UIView]?) {
        Roundify.apply(on: views, toHalfCirle: false, cornerRadius: cornerRadius)
    }
}
