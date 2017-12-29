//
//  ViewController.swift
//  IBDecoration
//
//  Created by Robert Kaleciński on 14.11.2017.
//  Copyright © 2017 Robert Kaleciński. All rights reserved.
//

import UIKit
import IBDecorators

class ViewController: UIViewController {
    
    @IBOutlet
    var avatarImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Roundify.toHalfCircle(on: [avatarImageView])
    }
}
