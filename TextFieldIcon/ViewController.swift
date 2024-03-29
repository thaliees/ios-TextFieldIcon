//
//  ViewController.swift
//  TextFieldIcon
//
//  Created by Thaliees on 6/27/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var text: UILabel!
    
    private var witdhTextField:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Implement the Delegate
        textField.delegate = self
        textField2.delegate = self
        // Indicate the icon and the position
        textField.rightViewMode = .always
        textField.rightView = UIImageView(image: UIImage(named: "send"))
        textField2.rightViewMode = .whileEditing
        textField2.rightView = UIImageView(image: UIImage(named: "send"))
        // Indicate the width of our TextField
        witdhTextField = textField.frame.size.width
    }

    // MARK: GestureRecognizer
    @IBAction func handleTouchAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Get the position of the touch
            let locationX = sender.location(in: textField).x
            if locationX >= witdhTextField - 25{
                self.updateText()
            }
            else{
                // Show keyboard
                self.textField.becomeFirstResponder()
            }
        }
    }
    
    @IBAction func handleTouchIconAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Get the position of the touch
            let locationX = sender.location(in: textField2).x
            if locationX >= witdhTextField - 25{
                self.updateTextField()
            }
            else{
                // Show keyboard
                self.textField2.becomeFirstResponder()
            }
        }
    }
    
    // MARK: Keyboard Function
    // This will be for when any part of the screen is touched, the keyboard is hidden
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Custom Function
    private func updateText(){
        if textField.text!.count > 0 {
            text.text = textField.text
            textField.text = ""
            // Hide keyboard
            self.view.endEditing(true)
        }
    }
    
    private func updateTextField(){
        if textField2.text!.count > 0 {
            textField.text = textField2.text
            textField2.text = ""
            // Hide keyboard
            self.view.endEditing(true)
        }
    }
}

