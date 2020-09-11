//
//  FavoritesCell.swift
//  JokesApp
//
//  Created by Alina Verigina on 08.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    @IBOutlet weak var jokeLiked: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackground.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 7, spread: 0)
    }
    
    
    public func configureFav (with textLiked: String) {
        jokeLiked.text = textLiked
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "FavoritesCell", bundle: nil)
    }
    
}
