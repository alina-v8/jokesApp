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
    
    
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var jokeBody: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var shareDelegate: ShareButtonDelegate?
    var likeDelegate: LikeButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.isUserInteractionEnabled = true
        

        
        likeButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        shareButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 1, blur: 5, spread: 0)
        
        background.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 7, spread: 0)
    }
    
    
    
    public func configure (with jText: String) {
        
        jokeBody.text = jText
    }

    
    static func nib() -> UINib {
        
        return UINib(nibName: "JokeCell", bundle: nil)
        
        
    }
    
    @IBAction func shareButtonTapped (_ sender: UIButton) {
        
        shareDelegate?.didTapShare(jokeText: jokeBody.text!)
        
    }
    @IBAction func likeButtonTapped (_ sender: UIButton) {
        
        likeDelegate?.didTapLike(savedJoke: jokeBody.text!)
        
    }
}

//Extension to add shadows used in Sketch


extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
