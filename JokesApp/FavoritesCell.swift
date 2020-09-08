//
//  FavoritesCell.swift
//  JokesApp
//
//  Created by Alina Verigina on 08.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var favJoke: UILabel!
    @IBOutlet weak var favBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        favBackground.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 7, spread: 0)
        
    }

 
 public func configureFav (with favText: String) {
     
    favJoke.text = favText
 }
 
 
 static func nib() -> UINib {
     
     return UINib(nibName: "FavoritesCell", bundle: nil)
     
     
 }
    
}
