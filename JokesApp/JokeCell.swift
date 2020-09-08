//
//  JokeCell.swift
//  JokesApp
//
//  Created by Alina Verigina on 08.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

//BOSS 

protocol ShareButtonDelegate {
    func didTapShare(jokeText: String)
}

protocol LikeButtonDelegate {
    func didTapLike (savedJoke: String)
}

class JokeCell: UITableViewCell {
    
    
    
    override func prepareForReuse() {
           
    }
    
    @IBOutlet weak var jokeBody: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var cell: UIView!
    
    var shareDelegate: ShareButtonDelegate?
    var likeDelegate: LikeButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.isUserInteractionEnabled = true
            
    }
    
    
    
    public func configure (with jText: String) {
        
        jokeBody.text = jText
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        
//    }
//    
    
    static func nib() -> UINib {

        return UINib(nibName: "JokeCell", bundle: nil)
        
    
    }
    
    @IBAction func shareButtonTapped (_ sender: UIButton) {
        
        shareDelegate?.didTapShare(jokeText: jokeBody.text!)
        print ("share")
        
    }
    @IBAction func likeButtonTapped (_ sender: UIButton) {
        
        likeDelegate?.didTapLike(savedJoke: jokeBody.text!)
     
        print ("like")
    }
}
