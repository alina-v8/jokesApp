//
//  JokesVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 06.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

class JokesVC: UIViewController {
    
    var jokes = [Joke]()
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokesTableView.backgroundColor = .clear

        jokesTableView.register(JokeCell.nib(), forCellReuseIdentifier: "JokeCell")
        jokesTableView.estimatedRowHeight = 160
        jokesTableView.rowHeight = UITableView.automaticDimension

        jokesTableView.dataSource = self
        jokesTableView.delegate = self
        
        let urlString = "https://api.icndb.com/jokes/random/100"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                parse(json: data)
            }
        }
    }
    
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        if let jsonJokes = try? decoder.decode(JokeList.self, from: json) {
            jokes = jsonJokes.value
            jokesTableView.reloadData()
            
        }
    }

   
    
}

extension JokesVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokesTableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        let ourJoke = jokes[indexPath.row]
//        cell.textLabel?.text = ourJoke.joke
        
        cell.configure(with: ourJoke.joke)
        return cell
    }
 
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    
            return 160
        }
    

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 160
        }
    

   
    
}
