//
//  SettingsVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 10.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit


 var newName = String()
var newLastName = String()


class SettingsVC: UIViewController {
    
    
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        lastNameView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        offlineView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        saveButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.italicSystemFont(ofSize: 17)])
        
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, .font: UIFont.italicSystemFont(ofSize: 17)])
        
        // dismiss keyboard on tap
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        sender.showAnimation {
            
        }
        
        newName = nameTextField.text ?? ""
        newLastName = lastNameTextField.text ?? ""
                
        let name = Notification.Name(rawValue: "newCharacterName")
        NotificationCenter.default.post(name: name, object: newName)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func offlineSwitch(_ sender: UISwitch) {
        
    }
    
}


