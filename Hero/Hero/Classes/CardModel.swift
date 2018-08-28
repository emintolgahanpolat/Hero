//
//  CardModel.swift
//  Hero
//
//  Created by Glny Gl on 13.08.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards() -> [Card] {
        
        var cardArray = [Card]()
        var numbers1 = [1,2,3,4,5,6,7,8,9,10]
        var numbers2 = [1,2,3,4,5,6,7,8,9,10]
        for _ in 1...10{
            let rand =  Int(arc4random_uniform(UInt32(numbers1.count-1)))
            
            let firstCard = Card()
            firstCard.imageId = numbers1[rand]
            firstCard.imageName = "\(numbers1[rand])"
            cardArray.append(firstCard)

            print(firstCard.imageId)
            numbers1.remove(at: Int(rand))
        }
        for _ in 1...10{
            let rand =  Int(arc4random_uniform(UInt32(numbers2.count-1)))
            
            let secondCard = Card()
            secondCard.imageId = numbers2[rand]
            secondCard.imageName = "\(numbers2[rand])"
            cardArray.append(secondCard)
            
            print(secondCard.imageId)
            numbers2.remove(at: Int(rand))
        }
        return cardArray
    }    
}
