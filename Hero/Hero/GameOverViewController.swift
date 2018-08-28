//
//  GameOverViewController.swift
//  Hero
//
//  Created by Glny Gl on 17.08.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground(background)
        
    }

    @IBOutlet weak var background: UIImageView!
    
    func setBackground(_ imageView: UIImageView){
        let rand = arc4random_uniform(10)+1
        let image = UIImage(named: "w\(rand)")
        imageView.image = image
    }
    @IBAction func playAgain(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainStoryboardID") as! ViewController
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
}
