//
//  ViewController.swift
//  catchToSaul
//
//  Created by Umut Erol on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl_timer: UILabel!
    @IBOutlet weak var lbl_score: UILabel!
    @IBOutlet weak var lbl_highScore: UILabel!
    
    var score = 0
    var time = 4
    var imageHiddenNumber = 7
    var highScore = 0
    
    var imageViewList = [UIImageView]()
    
    var alert = UIAlertController(title: "Time's over", message:"Do you want to start new game? ", preferredStyle: UIAlertController.Style.alert)
   

    
    @IBOutlet weak var iwSaul1: UIImageView!
    @IBOutlet weak var iwSaul2: UIImageView!
    @IBOutlet weak var iwSaul3: UIImageView!
    @IBOutlet weak var iwSaul4: UIImageView!
    @IBOutlet weak var iwSaul5: UIImageView!
    @IBOutlet weak var iwSaul6: UIImageView!
    @IBOutlet weak var iwSaul7: UIImageView!
    @IBOutlet weak var iwSaul8: UIImageView!
    @IBOutlet weak var iwSaul9: UIImageView!
    

    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageViewList.append(iwSaul1)
        imageViewList.append(iwSaul2)
        imageViewList.append(iwSaul3)
        imageViewList.append(iwSaul4)
        imageViewList.append(iwSaul5)
        imageViewList.append(iwSaul6)
        imageViewList.append(iwSaul7)
        imageViewList.append(iwSaul8)
        imageViewList.append(iwSaul9)
        
       
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            lbl_highScore.text = "High score: " + String(highScore)
        }
        if let finallyHighScore = storedHighScore as? Int {
            highScore = finallyHighScore
            lbl_highScore.text = "High score: " + String(highScore)
        }
    
        iwSaul1.isUserInteractionEnabled = true
        iwSaul2.isUserInteractionEnabled = true
        iwSaul3.isUserInteractionEnabled = true
        iwSaul4.isUserInteractionEnabled = true
        iwSaul5.isUserInteractionEnabled = true
        iwSaul6.isUserInteractionEnabled = true
        iwSaul7.isUserInteractionEnabled = true
        iwSaul8.isUserInteractionEnabled = true
        iwSaul9.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        iwSaul1.addGestureRecognizer(gestureRecognizer)
        iwSaul2.addGestureRecognizer(gestureRecognizer2)
        iwSaul3.addGestureRecognizer(gestureRecognizer3)
        iwSaul4.addGestureRecognizer(gestureRecognizer4)
        iwSaul5.addGestureRecognizer(gestureRecognizer5)
        iwSaul6.addGestureRecognizer(gestureRecognizer6)
        iwSaul7.addGestureRecognizer(gestureRecognizer7)
        iwSaul8.addGestureRecognizer(gestureRecognizer8)
        iwSaul9.addGestureRecognizer(gestureRecognizer9)
        
        iwSaul1.isHidden = true
        iwSaul2.isHidden = true
        iwSaul3.isHidden = true
        iwSaul4.isHidden = true
        iwSaul5.isHidden = true
        iwSaul6.isHidden = true
        iwSaul7.isHidden = true
        iwSaul8.isHidden = true
        iwSaul9.isHidden = true
        
        
        let alertButton = UIAlertAction(title: "No", style: UIAlertAction.Style.default) { UIAlertAction in
            for imageViewValue in self.imageViewList{
                imageViewValue.isHidden = true
            }
            
            
        }
        let alertButton2 = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { UIAlertAction in
            
            self.iwSaul1.isUserInteractionEnabled = true
            self.iwSaul2.isUserInteractionEnabled = true
            self.iwSaul3.isUserInteractionEnabled = true
            self.iwSaul4.isUserInteractionEnabled = true
            self.iwSaul5.isUserInteractionEnabled = true
            self.iwSaul6.isUserInteractionEnabled = true
            self.iwSaul7.isUserInteractionEnabled = true
            self.iwSaul8.isUserInteractionEnabled = true
            self.iwSaul9.isUserInteractionEnabled = true
            self.time = 4
            self.score = 0
            self.lbl_score.text = "Score: " + String(self.score)
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)

        }
        
        alert.addAction(alertButton)
        alert.addAction(alertButton2)
            
        
        
    
    }
    
  

    
    

    @objc func clickImageView() {
        score += 1
        lbl_score.text = "Score: " + String(score)
    }
    
    @objc func timerAction() {
    
        lbl_timer.text = String(time)
        time -= 1
        
        
        
        imageHiddenNumber = Int.random(in: 1 ... 9)
        
        
        iwSaul1.tag = 1
        iwSaul2.tag = 2
        iwSaul3.tag = 3
        iwSaul4.tag = 4
        iwSaul5.tag = 5
        iwSaul6.tag = 6
        iwSaul7.tag = 7
        iwSaul8.tag = 8
        iwSaul9.tag = 9
        
        if iwSaul1.tag == imageHiddenNumber {
            iwSaul1.isHidden = false
        }
        else{
            iwSaul1.isHidden = true
        }
        
        if iwSaul2.tag == imageHiddenNumber{
            iwSaul2.isHidden = false
        }
        else{
            iwSaul2.isHidden = true
        }
        
        if iwSaul3.tag == imageHiddenNumber{
            iwSaul3.isHidden = false
        }else{
            iwSaul3.isHidden = true
        }
        
        if iwSaul4.tag == imageHiddenNumber{
            iwSaul4.isHidden = false
        }else{
            iwSaul4.isHidden = true
        }

        if iwSaul5.tag == imageHiddenNumber{
            iwSaul5.isHidden = false
        }else{
            iwSaul5.isHidden = true
        }
        
        if iwSaul6.tag == imageHiddenNumber{
            iwSaul6.isHidden = false
        }else{
            iwSaul6.isHidden = true
        }
        
        if iwSaul7.tag == imageHiddenNumber{
            iwSaul7.isHidden = false
        }else{
            iwSaul7.isHidden = true
        }
        
        if iwSaul8.tag == imageHiddenNumber{
            iwSaul8.isHidden = false
        }else{
            iwSaul8.isHidden = true
        }
        
        if iwSaul9.tag == imageHiddenNumber{
            iwSaul9.isHidden = false
        }else{
            iwSaul9.isHidden = true
        }
        
        
        
        if time < 0 {
            timer.invalidate()
            lbl_timer.text = "Time's over"
            self.present(alert, animated: true,completion: nil)
            iwSaul1.isUserInteractionEnabled = false
            iwSaul2.isUserInteractionEnabled = false
            iwSaul3.isUserInteractionEnabled = false
            iwSaul4.isUserInteractionEnabled = false
            iwSaul5.isUserInteractionEnabled = false
            iwSaul6.isUserInteractionEnabled = false
            iwSaul7.isUserInteractionEnabled = false
            iwSaul8.isUserInteractionEnabled = false
            iwSaul9.isUserInteractionEnabled = false
            
            
            if score > highScore {
                print("logHighScore")
                highScore = score
                print(highScore)
                
                UserDefaults.standard.set(highScore, forKey: "highScore")
                lbl_highScore.text = "High score: " + String(highScore)

            }
            
            
        }
    }
    
    

}

