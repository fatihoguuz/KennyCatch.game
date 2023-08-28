//
//  ViewController.swift
//  kennyCatch
//
//  Created by Fatih Oğuz on 27.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    @IBOutlet weak var highScoreLabel: UILabel!
    var highScore = 0
    @IBOutlet weak var restartButton: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var counter = 0
    var kennyAray = [UIImageView()]
    var timerHide = Timer()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    
    @IBOutlet weak var restartt: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kennyAray = [imageView,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,imageView8,imageView9]
        
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Higscore: \(highScore)"
        }
            if let newScore = storedHighScore as? Int
        {
                highScore = newScore
                highScoreLabel.text = "Highscore: \(highScore)"
            }
        
        
        counter = 10
        timerLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        timerHide = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        imageView.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true
        
        imageView.addGestureRecognizer(recognizer)
        imageView2.addGestureRecognizer(recognizer2)
        imageView3.addGestureRecognizer(recognizer3)
        imageView4.addGestureRecognizer(recognizer4)
        imageView5.addGestureRecognizer(recognizer5)
        imageView6.addGestureRecognizer(recognizer6)
        imageView7.addGestureRecognizer(recognizer7)
        imageView8.addGestureRecognizer(recognizer8)
        imageView9.addGestureRecognizer(recognizer9)
        
        
        hideKenny()
        
        restartt.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(restartBut))
        restartt.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
    func replayFunc() {
        self.counter = 10
        self.score = 0
        self.scoreLabel.text = "Score \(self.score)"
        self.timerLabel.text = String(self.counter)
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
        self.timerHide = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text =  "Score: \(score)"
    }
    
    
    @objc func hideKenny() {
        for kenny in kennyAray {
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyAray.count - 1)))
        kennyAray[random].isHidden = false
    }
    
    @objc func timerFunction() {
        timerLabel.text = " \(counter)"
        counter -= 1
        if counter < 0 {
            timer.invalidate()
            timerHide.invalidate()
            timerLabel.text == "Time: 0"
            let alert = UIAlertController(title: "Times Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.replayFunc()
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
        }
        
    }
    @objc func restartBut() {
        print("calisiyor")
        let alert1 = UIAlertController(title: "Stop", message:"Are you sure you want to replay?", preferredStyle: UIAlertController.Style.alert)
        /* let alertButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
         (UIAlertAction) in
         self.replayFunc()
         
         
         }
         */
        let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
        }
        
        alert1.addAction(replayButton)
        self.present(alert1, animated: true, completion: nil)
        
        
        
        
        
        
        
    }
    
    
    
}
