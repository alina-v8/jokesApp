//
//  JokeCell.swift
//  JokesApp
//
//  Created by Alina Verigina on 08.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

class JokeCell: UITableViewCell {
    
    @IBOutlet weak var jokeBody: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "JokeCell", bundle: nil)
    }
    
    @IBAction func shareButtonTapped (_ sender: UIButton) {
        
    }
    @IBAction func likeButtonTapped (_ sender: UIButton) {
        
    }
}
