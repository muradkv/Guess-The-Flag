//
//  ViewController.swift
//  Guess The Flag
//
//  Created by murad on 16/04/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var tapped = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["us", "russia", "uk", "estonia", "nigeria", "poland", "monaco", "italy", "france", "germany", "spain", "england"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String 
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            tapped += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            tapped += 1
        }
        
        if tapped == 10 {
            showAlert(title: "And last one was \(title)", buttonTitle: "New game", message: "Game Over. Your final score is \(score).")
            tapped = 0
            score = 0
        } else {
            showAlert(title: title, buttonTitle: "Continue", message: "Your score is \(score).")
        }
    }
    
    func showAlert(title: String, buttonTitle: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: askQuestion))
        present(ac, animated: true)
    }
}

