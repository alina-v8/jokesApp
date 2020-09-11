//
//  SettingsVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 10.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

var isOffline = Bool()
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
        
        
        // Dismissing keyboard on tap.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        sender.showAnimation {
        }
        
        let dismissVC = storyboard?.instantiateViewController(withIdentifier: "favoriteJokes") as! FavoriteJokes
        present(dismissVC, animated: true, completion: nil)
        
        newName = nameTextField.text ?? ""
        newLastName = lastNameTextField.text ?? ""
        
        let name = Notification.Name(rawValue: "newCharacterName")
        NotificationCenter.default.post(name: name, object: newName)
        
    }
    
    
    
    @IBAction func checkSwitchPosition(_ sender: UISwitch) {
        
        if sender.isOn == true {
            isOffline = true
            
        } else {
            isOffline = false
        }
    }
}


