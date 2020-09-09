//
//  FavoriteJokes.swift
//  JokesApp
//
//  Created by Alina Verigina on 08.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit


class FavoriteJokes: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.reloadData()
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        favoritesTableView.register(FavoritesCell.nib(), forCellReuseIdentifier: "FavoritesCell")
        favoritesTableView.backgroundColor = .clear
        favoritesTableView.showsVerticalScrollIndicator = false
        
        addButton.layer.cornerRadius = addButton.frame.height / 2
        addButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 5, blur: 8, spread: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        favoritesTableView.reloadData()
    }
    
    
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        let addVC = storyboard?.instantiateViewController(withIdentifier: "addJokeScreen") as! AddJokeVC
        addVC.jokeDelegate = self
        present(addVC, animated: true, completion: nil)
        
    }
    
}




extension FavoriteJokes: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedJokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        
        let myJokes = likedJokes[indexPath.row]
        cell.configureFav(with: myJokes)
        return cell
    }
    
    
}

extension FavoriteJokes: UserJokeDelegate {
    func saveButtonTapped(userJoke: String) {
        
        if userJoke.isEmpty == true {
            return
        } else {
            
            likedJokes.append(userJoke)
            let indexPath = IndexPath(row: likedJokes.count - 1, section: 0)
            
            
            favoritesTableView.beginUpdates()
            favoritesTableView.insertRows(at: [indexPath], with: .automatic)
            favoritesTableView.endUpdates()
            
        }
        
    }
    
    
    
}
