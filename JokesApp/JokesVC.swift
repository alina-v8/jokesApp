//
//  JokesVC.swift
//  JokesApp
//
//  Created by Alina Verigina on 06.09.2020.
//  Copyright © 2020 Alina Verigina. All rights reserved.
//

import UIKit

var replacedStrings = [String]()
var replacedJokes = [String]()
var likedJokes = [String]()



class JokesVC: UIViewController {
    
    var someStr = ["Connection lost", "Damn"]
    var jokes = [Joke]()
    let replacementName = newName
    let namePassed = Notification.Name(rawValue: "newCharacterName")
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBOutlet weak var noConnectionView: UIView!
    @IBOutlet weak var jokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        jokesTableView.backgroundColor = .clear
        jokesTableView.showsVerticalScrollIndicator = false
        
        jokesTableView.register(JokeCell.nib(), forCellReuseIdentifier: "JokeCell")
        jokesTableView.rowHeight = UITableView.automaticDimension
        jokesTableView.estimatedRowHeight = 160
        
        
        
        jokesTableView.dataSource = self
        jokesTableView.delegate = self
        
        
        
        createObserver()
        //        secondObserver()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        apiRequest()
        
        
    }
    
    func createObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterNameAll(notification:)), name: namePassed, object: nil)
        
    }
    
    //    func secondObserver() {
    //
    //        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterNameLiked(notification:)), name: namePassed, object: nil)
    //
    //    }
    
    @objc func updateCharacterNameAll (notification: NSNotification) {
        
        if  likedJokes.isEmpty == true {
            return
        } else {
            
            allLoop()
            likedLoop()
            
            
        }
        
        
        
    }
    func allLoop (){
        for apiJoke in jokes {
            let oneJoke = apiJoke.joke.replacingOccurrences(of: "Chuck Norris", with: newName + " " + newLastName)
            replacedJokes.append(oneJoke)
        }
        
        //        print ("ALL: \(replacedJokes)")
    }
    
    
    func likedLoop () {
        
        for str in likedJokes {
            let oneString = str.replacingOccurrences(of: "Chuck Norris", with: newName + " " + newLastName)
            replacedStrings.append(oneString)
            
        }
        likedJokes = replacedStrings
        //        print ("LIKED: \(replacedStrings)")
        //         print ("OK: \(likedJokes)")
    }
    
    
    
    func apiRequest () {
        
        if isOffline == false {
            
            let urlString = "https://api.icndb.com/jokes/random/100"
            
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    
                    parse(json: data)
                    
                    noConnectionView.backgroundColor = .clear
                }
            }
            
        } else {
            
            let alert = UIAlertController(title: "Oops!", message: "Connection Lost!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present (alert, animated: true, completion: nil)
            
            noConnectionView.backgroundColor = .black
        }
    }
    
    func parse(json: Data) {
        
        let decoder = JSONDecoder()
        if let jsonJokes = try? decoder.decode(JokeList.self, from: json) {
            jokes = jsonJokes.value
            jokesTableView.reloadData()
            
        }
    }
    
    
    //Shake gesture
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            apiRequest()
        }
    }
    
}

extension JokesVC: ShareButtonDelegate {
    
    func didTapShare(jokeText: String) {
        let message = jokeText
        let vc = UIActivityViewController(activityItems: [message], applicationActivities:  [])
        present(vc, animated: true)
        
        
    }
    
    
    
}


extension JokesVC: LikeButtonDelegate {
    func didTapLike(savedJoke: String) {
        
        if likedJokes.contains(savedJoke) {
            print ("it's aldeady added")
            return
            
        } else {
            
            likedJokes.append(savedJoke)
            
            defaults.set(likedJokes, forKey: "likedJokesArray")
        }
        
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
    
    
    
}


//extension Array where Element: Equatable {
//    func replacingMultipleOccurrences(using array: (of: Element, with: Element)...) -> Array {
//        var newArr: Array<Element> = self
//
//        for replacement in array {
//            for (index, item) in self.enumerated() {
//                if item == replacement.of {
//                    newArr[index] = replacement.with
//                }
//            }
//        }
//
//        return newArr
//    }
//}




