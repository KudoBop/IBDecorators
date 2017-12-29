//
//  DarkTheme.swift
//  IBDecorators
//
//  Created by Robert Kaleciński on 14.11.2017.
//  Copyright © 2017 Robert Kaleciński. All rights reserved.
//

import UIKit

public class DarkTheme : NSObject {
    
    @IBOutlet
    public var backgroundView: UIView? {
        didSet {
            guard let view = backgroundView else { return }
            
            view.backgroundColor = Styles.faded.color
        }
    }
    
    @IBOutlet
    public var primaryButtons: [UIButton]? {
        didSet {
            guard let buttons = primaryButtons else { return }
            
            buttons.forEach { (button) in
                
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [
                    Styles.primary.gradient.0.cgColor,
                    Styles.primary.gradient.1.cgColor
                ]
                gradientLayer.locations = [0.0, 1.0]
                gradientLayer.frame = button.bounds
                
                button.layer.insertSublayer(gradientLayer, at: 0)
                button.clipsToBounds = true
                button.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
    
    @IBOutlet
    public var secondaryButtons: [UIButton]? {
        didSet {
            guard let buttons = secondaryButtons else { return }
            
            buttons.forEach { (button) in
                button.tintColor = Styles.lightFaded.color
            }
        }
    }
    
    @IBOutlet
    public var subtitleLabels: [UILabel]? {
        didSet {
            guard let labels = subtitleLabels else { return }
            
            DarkTheme
                .appliedOn(labels: labels)
                .forEach { $0.textAlignment = .center }
        }
    }
    
    public static func appliedOn(labels: [UILabel]) -> [UILabel] {
        labels.forEach { (label) in
            label.textColor = Styles.lightFaded.color
        }
        return labels
    }
}
