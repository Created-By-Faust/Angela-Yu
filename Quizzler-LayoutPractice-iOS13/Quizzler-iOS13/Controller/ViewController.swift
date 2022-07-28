//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerActionPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // Button1, Button2 or Button3
        
        let userGotITRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotITRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        upButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        downButton.backgroundColor = UIColor.clear
        
        upButton.setTitle(quizBrain.getAnswerOptions(1), for: .normal)
        middleButton.setTitle(quizBrain.getAnswerOptions(2), for: .normal)
        downButton.setTitle(quizBrain.getAnswerOptions(3), for: .normal)
        
    }
}

