//
//  RegisterViewController.swift
//  LearnMVPandMVVM
//
//  Created by Ly Chenghav on 1/10/23.
//

import UIKit
import SkyFloatingLabelTextField
class RegisterViewController: UIViewController {

    @IBOutlet weak var myTextFields: SkyFloatingLabelTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
            
        myTextFields.title = "លេខទូរស័ព្ទ"
        myTextFields.keyboardType = .numberPad
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Define a character set containing valid numeric characters
           let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
           
           // Check if the replacement string contains only valid characters
           let isValid = string.rangeOfCharacter(from: allowedCharacterSet.inverted) == nil
           
           return isValid
       }
   }

