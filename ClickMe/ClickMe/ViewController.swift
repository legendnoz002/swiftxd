//
//  ViewController.swift
//  ClickMe
//
//  Created by student on 16/1/2562 BE.
//  Copyright © 2562 BUU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var numRound: Int = 0;
    let numScore: Int = 100;
    var sumScore: Int = 0;
    @IBOutlet weak var slider: UISlider!
   // @IBOutlet weak var sumScoreLabel: UILabel!
    @IBOutlet weak var integerRandom: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    var targetValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        randomNew()
        
        let thumbImageNormal =  UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func alertMessage(_ sender: Any) {
        let difference = abs(targetValue - currentValue);
        let title: String
        if difference == 0{
            title = "Perfact!!"
            sumScore+=100
        }else if difference <= 5{
            title = "You almost had it!!"
            sumScore+=50
        }else if difference <= 10{
            title = "Pretty good!!"
            sumScore+=10
        }else{
        title = "Not even close..."
            
        }
                
        //let alertController = UIAlertController(title: "iOScreator", message:
        //"Hello, world!", preferredStyle: UIAlertController.Style.alert)
        let message = "The value of the Random is: \(targetValue)\n" +
        "The value of the slider is: \(currentValue)\n" +
        "The value of the Difference is: \(difference)"
        
        let alert = UIAlertController(title: title,message: message,preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler:{ _ in
                                    self.setScore()
                                   // self.reset()
                                    self.randomNew()
                                    })
        //self คือ อ้างอิงถึงตัวเอง
        //_ in คือ คือการกำหนดฟังค์ชั่นไม่มีตัวแปร
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
        
        //คำสั่งปิด messagebox
        //alertController.addAction(UIAlertAction(title: "Dismiss", style: U    IAlertAction.Style.default,handler: nil))
        
        //self.present(alertController, animated: true, completion: nil)
    }
//    func reset(){
//        currentValue = 50
//        slider.value = Float(currentValue)
//    }
    @IBAction func startOver(){
        sumScore = 0;
        numRound = 0;
        score.text = String(sumScore);
        randomNew();
        
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func randomNew(){
        currentValue = 50
        slider.value = Float(currentValue)
        //random value for play
        targetValue = Int.random(in: 1...100)
        integerRandom.text = String(targetValue)
        //increment value variable round
        numRound = numRound+1
        round.text = String(numRound);
        
        
    }
    func setScore(){
        let temp = calculateScore(targetValue: targetValue);
        sumScore+=temp;
        score.text = String(sumScore)
      
       // sumScoreLabel.text = String(sumScore)
    }
    func calculateScore(targetValue: Int) -> Int{
        return numScore - (abs(targetValue - lroundf(slider.value)))
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
       
        //print("The value of the slider is now: \(slider.value)")
    }
    @IBAction func help(){
        let message = "The Game will random values 1...100 at show top title. The you slide near value of slide bar. Then you get point follows you slide. Start Over button is rescore and new game."
        
        let alert = UIAlertController(title: "How to play",message: message,preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default,handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


}

