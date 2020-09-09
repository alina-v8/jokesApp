//
//  AddJokeVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 09.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

class AddJokeVC: UIViewController {

    @IBOutlet weak var addJokeView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var jokeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

          addJokeView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 7, spread: 0)
        
        cancelButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        saveButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        
        jokeTextField.attributedPlaceholder = NSAttributedString(string: "Type your joke here", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 17)])
    }
    



}
