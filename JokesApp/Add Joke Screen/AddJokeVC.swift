//
//  AddJokeVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 09.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

protocol UserJokeDelegate {
    func saveButtonTapped (userJoke: String)
}

class AddJokeVC: UIViewController {
    
    @IBOutlet weak var addJokeView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var jokeTextView: UITextView!
    @IBOutlet weak var textInputLabel: UILabel!
    
    var jokeDelegate: UserJokeDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeTextView.delegate = self
        
        
        addJokeView.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 7, spread: 0)
        cancelButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        saveButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true) {
        }
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let customJoke = jokeTextView.text
        
        jokeDelegate.saveButtonTapped(userJoke: customJoke ?? "")
        
        dismiss(animated: true) {
        }
    }
    
}

// Limiting input length.

extension AddJokeVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let starterText = textView.text ?? ""
        
        guard let stringRange = Range(range, in: starterText) else { return false }
        
        let updatedText = starterText.replacingCharacters(in: stringRange, with: text)
        
        textInputLabel.text = "\(updatedText.count)/200"
        
        return updatedText.count <= 200
    }
}
