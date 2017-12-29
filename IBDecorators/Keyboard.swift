//
//  Keyboard.swift
//  IBDecorators
//
//  Created by Robert Kaleciński on 16.11.2017.
//  Copyright © 2017 Robert Kaleciński. All rights reserved.
//

import UIKit

class Keyboard : NSObject {
    
    @IBOutlet
    public var mainView: UIView? {
        didSet {
            addObserverWhenReady()
        }
    }
    
    @IBOutlet
    public var scrollView: UIScrollView? {
        didSet {
            addObserverWhenReady()
        }
    }
    
    @IBOutlet
    public var textFields: [UITextField]? {
        didSet {
            guard let fields = textFields else { return }
            
            fields.forEach { (tf) in
                tf.delegate = self
            }
            addObserverWhenReady()
        }
    }
    
    var activeField: UITextField?
    
    func addObserverWhenReady() {
        guard textFields != nil && scrollView != nil && mainView != nil else {
            return
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didShow),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didHide),
            name: NSNotification.Name.UIKeyboardDidHide,
            object: nil
        )
    }
    
    @objc
    func didShow(sender: NSNotification) {
        
        guard
            let scroll = scrollView,
            let view = mainView,
            let field = activeField else { return }
        
        let info = sender.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
        scroll.contentInset = contentInsets;
        scroll.scrollIndicatorInsets = contentInsets;

        var aRect = view.frame;
        aRect.size.height -= keyboardSize.height;
        let fieldPoint = field.frame.origin
        if (!aRect.contains(fieldPoint)) {
            scroll.scrollRectToVisible((field.frame), animated: true)
        }
    }
    
    @objc
    func didHide(sender: NSNotification) {
        let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
        self.scrollView?.setContentOffset(CGPoint(x: 0, y: -self.mainView!.frame.origin.y/2), animated: true)
    }
}

extension Keyboard : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if
            let foundIndex = textFields?.index(of: textField),
            let fields = textFields,
            foundIndex < fields.count - 1 {
            fields[foundIndex + 1].becomeFirstResponder()
        }
        
        return true
    }
}
