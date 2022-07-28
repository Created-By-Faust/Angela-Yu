//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4")]

    @IBOutlet weak var ballView: UIImageView!
    
    @IBAction func AnswerButton(_ sender: UIButton) {
        ballView.image = ballArray[Int.random(in: 0...4)]
    }
    
}

