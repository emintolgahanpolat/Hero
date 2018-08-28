//
//  ViewController.swift
//  Hero
//
//  Created by Glny Gl on 29.07.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = CardModel()
    var array = [Card]()
    var buttonArray = [UIButton]()
    var firstCard = 0
    var secondCard = 0
    var firstCardId = 0
    var secondCardId = 0
    var matched = 0
    
    
    @IBOutlet weak var cardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = model.getCards()
    }
    
    func setCard(_ sender: UIButton, _ card: Card){
        let image = UIImage(named: card.imageName)
        sender.setBackgroundImage(image, for: .normal)
    }
    
    func flipCard(_ sender: UIButton, _ card: Card){
        if firstCard == 0 {
            if card.isFlipped == false {
                setCard(sender, array[sender.tag-1])
                animateCard(sender, callback: nil)
                card.isFlipped = true
                firstCard = 1
                firstCardId = card.imageId            }
        }
        else if secondCard == 0 {
            if card.isFlipped == false
            {
                setCard(sender, array[sender.tag-1])
                card.isFlipped = true
                secondCard = 1
                secondCardId = card.imageId
                
                animateCard(sender, callback: {
                    self.result(self.firstCardId, self.secondCardId, sender)
                })
            }
        }
    }
    
    
    func animateCard(_ sender: UIButton, callback: (()->())? = nil )
    {
        UIView.transition(with: sender, duration: 0.12, options: .transitionFlipFromRight, animations: {
            
        }) { (completed) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                callback?()
            }
            
        }
    }
    
    func turnBackCard(_ sender: UIButton){
        let image = UIImage(named: "H-80-80")
        sender.setBackgroundImage(image, for: .normal)
        self.animateCard(sender)
    }
    
    func result(_ firstCardId: Int, _ secondCardId: Int, _ sender: UIButton) {
        if firstCardId == secondCardId {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                self.remove()
            }
            firstCard = 0
            secondCard = 0
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                self.refresh(self.array)
            }
            firstCard = 0
            secondCard = 0
        }
    }
    
    
    @IBAction func turnCard(_ sender: UIButton) {
        buttonArray.append(sender)
        flipCard(sender,array[sender.tag-1])
        // gameOver()
    }
    
    func deneme (_ sender: UIButton, _ card: Card){
        let image = UIImage(named: card.imageName)
        sender.setBackgroundImage(image, for: .normal)
        UIView.transition(with: sender, duration: 0.12, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    func refresh(_ array: [Card]){
        for i in 1...20{
            if array[i-1].isFlipped == true {
                array[i-1].isFlipped = false
                for i in 0...buttonArray.count-1{
                    turnBackCard(buttonArray[i])
                }
            }
        }
        self.buttonArray.removeAll()
    }
    
    func remove(){
        for i in 0...buttonArray.count-1{
            buttonArray[i].alpha = 0
        }
        buttonArray.removeAll()
        matched += 1
        if(matched == 10){
            gameOver()
        }
    }
    
    func gameOver()
    {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let gameOverViewController = mainStoryboard.instantiateViewController(withIdentifier: "GameOverViewControllerID") as! GameOverViewController
        self.navigationController?.pushViewController(gameOverViewController, animated: true)   
    }
    
}


