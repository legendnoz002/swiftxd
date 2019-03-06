import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagePlayOne: UIImageView!
    @IBOutlet weak var imagePlayTwo: UIImageView!
    @IBOutlet weak var labelScore1: UILabel!
    @IBOutlet weak var labelScore2: UILabel!
    var player1: Int = 0
    var player2: Int = 0
    var ScorePlayer1: Int = 0
    var ScorePlayer2: Int = 0
    var imagePaper = UIImage(named: "paper.png")
    var imageHammer = UIImage(named: "hammer.png")
    var imageScisor = UIImage(named: "scissor.png")
    var message = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePlayOne.image=imagePaper
        imagePlayTwo.image=imageHammer
    }
    
    func randomNew(){
        player1 = Int.random(in: 1...3)
        player2 = Int.random(in: 1...3)
        
        if(player1==1){
            imagePlayOne.image=imagePaper
        }else if(player1==2){
            imagePlayOne.image=imageHammer
        }else{
            imagePlayOne.image=imageScisor
        }
        
        if(player2==1){
            imagePlayTwo.image=imagePaper
        }else if(player2==2){
            imagePlayTwo.image=imageHammer
        }else{
            imagePlayTwo.image=imageScisor
        }
        
        if(player1==player2){
            message="Draw!!"
        }else if(player1==1&&player2==3){
            ScorePlayer2+=1
            message="Player 2 Win!!"
        }else if(player1==1&&player2==2){
            ScorePlayer1+=1
            message="Player 1 Win!!"
        }else if(player1==2&&player2==1){
            ScorePlayer2+=1
            message="Player 2 Win!!"
        }else if(player1==2&&player2==3){
            ScorePlayer1+=1
            message="Player 1 Win!!"
        }else if(player1==3&&player2==1){
            ScorePlayer1+=1
            message="Player 1 Win!!"
        }else if(player1==3&&player2==2){
            ScorePlayer2+=1
            message="Player 2 Win!!"
        }
        
       
    }
    func setScore(){
        labelScore1.text=String(ScorePlayer1)
        labelScore2.text=String(ScorePlayer2)
        message=""
    }
    func show(){
        let alert = UIAlertController(title: "Whooss!!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            self.setScore()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func start(){
        randomNew()
        show()
    }
    @IBAction func restart(){
        ScorePlayer2=0
        ScorePlayer1=0
        setScore()
        message=""
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    


}

