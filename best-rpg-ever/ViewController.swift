//
//  ViewController.swift
//  best-rpg-ever
//
//  Created by Holly Klose on 2/9/16.
//  Copyright © 2016 Holly Klose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    var redPlayer = Redcat()
    var bluePlayer = Bluecat()
    
    


    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var redCat: UIImageView!
    @IBOutlet weak var cryingCat1: UIImageView!
    @IBOutlet weak var blueCat: UIImageView!
    @IBOutlet weak var cryingCat2: UIImageView!
    @IBOutlet weak var redHPLabel: UILabel!
    @IBOutlet weak var blueHPLabel: UILabel!
    @IBOutlet weak var restartGameOutlet: UIButton!
    @IBOutlet weak var redAttackOutlet: UIButton!
    @IBOutlet weak var blueAttackOutlet: UIButton!
    @IBOutlet weak var redRawrLabel: UILabel!
    @IBOutlet weak var blueRawrLabel: UILabel!

 
    
    func playerMayAttackAgain () {
        redAttackOutlet.enabled = true
        blueAttackOutlet.enabled = true
        redRawrLabel.text = "RAWR!"
        blueRawrLabel.text = "RAWR!"
    }
    
    
    
    @IBAction func redAttackButton(sender: AnyObject) {
        bluePlayer.attack(redPlayer.attackPwr, attacker: redPlayer)
        blueHPLabel.text = "\(bluePlayer.HP) HP!"
     
        if bluePlayer.isAlive {
            textLabel.text = "Red Kitty attacked Blue Kitty for \(redPlayer.totalAttackPower)"
            redAttackOutlet.enabled = false
            redRawrLabel.text = "Napping! ZZZ"
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "playerMayAttackAgain", userInfo: nil, repeats: false)
            
        } else {
            textLabel.text = "Red Kitty killed Blue Kitty!"
            cryingCat2.hidden = false
            blueCat.hidden = true
            restartGameOutlet.hidden = false
        
        }
    }
    
    @IBAction func blueAttackButton(sender: AnyObject) {
        redPlayer.attack(bluePlayer.attackPwr, attacker: bluePlayer)
        redHPLabel.text = "\(redPlayer.HP) HP!"
        
        if redPlayer.isAlive {
            textLabel.text = "Blue Kitty attacks Red Kitty for \(bluePlayer.totalAttackPower)"
            blueAttackOutlet.enabled = false
            blueRawrLabel.text = "Napping! ZZZ"
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "playerMayAttackAgain", userInfo: nil, repeats: false)
            
        } else {
            textLabel.text = "Blue Kitty killed Red Kitty!"
            cryingCat1.hidden = false
            redCat.hidden = true
            restartGameOutlet.hidden = false
        }
        
        
    }
    
    
    
    @IBAction func restartGameButton(sender: AnyObject) {
        redPlayer.restart()
        bluePlayer.restart()
        redHPLabel.text = "100 HP!"
        blueHPLabel.text = "100 HP!"
        cryingCat1.hidden = true
        cryingCat2.hidden = true
        redCat.hidden = false
        blueCat.hidden = false
       
        restartGameOutlet.hidden = true
        textLabel.text = "Let the Cat Fight Begin!"
        
    }
    



}

