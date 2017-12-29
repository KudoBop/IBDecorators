//
//  Colors.swift
//  IBDecorators
//
//  Created by Robert Kaleciński on 16.11.2017.
//  Copyright © 2017 Robert Kaleciński. All rights reserved.
//

import UIKit

public enum Styles {
    case faded
    case primary
    case lightFaded
}

public extension Styles {
    
    public var color: UIColor {
        switch self {
        case .faded:        return UIColor(red: 056/255, green: 068/255, blue: 082/255, alpha: 1)
        case .primary:      return UIColor(red: 111/255, green: 212/255, blue: 176/255 , alpha: 1)
        case .lightFaded:   return UIColor(red: 163/255, green: 175/255, blue: 198/255, alpha: 1)
        }
    }
    
    public var gradient: (UIColor, UIColor) {
        switch self {
        case .faded: return (
            UIColor(red: 056/255, green: 068/255, blue: 082/255, alpha: 1),
            UIColor(red: 056/255, green: 068/255, blue: 082/255, alpha: 1)
            )
        case .primary: return (
            UIColor(red: 111/255, green: 212/255, blue: 176/255 , alpha: 1),
            UIColor(red: 092/255, green: 198/255, blue: 235/255, alpha: 1)
            )
        case .lightFaded:return (
            UIColor(red: 056/255, green: 068/255, blue: 082/255, alpha: 1),
            UIColor(red: 056/255, green: 068/255, blue: 082/255, alpha: 1)
            )
        }
    }
}
