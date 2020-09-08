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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        favoritesTableView.register(FavoritesCell.nib(), forCellReuseIdentifier: "FavoritesCell")
        favoritesTableView.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritesTableView.reloadData()
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
