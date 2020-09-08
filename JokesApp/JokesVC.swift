//
//  JokesVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 06.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

// INTERN

var likedJokes = [String]()


class JokesVC: UIViewController {
    
    var jokes = [Joke]()

    
    @IBOutlet weak var jokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokesTableView.backgroundColor = .clear

        jokesTableView.register(JokeCell.nib(), forCellReuseIdentifier: "JokeCell")
        jokesTableView.rowHeight = UITableView.automaticDimension
        jokesTableView.estimatedRowHeight = 160

      

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

extension JokesVC: ShareButtonDelegate {
    
    func didTapShare(jokeText: String) {
//        let alertTitle = "Share this Joke?"
        let message = jokeText
            let vc = UIActivityViewController(activityItems: [message], applicationActivities:  [])
            present(vc, animated: true)
  
        
        }
    
//        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
//        present (alert, animated: true, completion: nil)
//    }
    
    
}


extension JokesVC: LikeButtonDelegate {
    func didTapLike(savedJoke: String) {
        
        likedJokes.append(savedJoke)
        
        
    }
    
    
    
    
}


extension JokesVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokesTableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.shareDelegate = self
        cell.likeDelegate = self
        let randomJoke = jokes[indexPath.row]
        cell.configure(with: randomJoke.joke)
        return cell
    }
 
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    
            return UITableView.automaticDimension
        }
    

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 160
        }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let myJoke = jokes[indexPath.row]
//        print ("You tapped: \(myJoke)")
//    }
   
    
}
