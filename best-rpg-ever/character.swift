//
//  character.swift
//  best-rpg-ever
//
//  Created by Holly Klose on 2/12/16.
//  Copyright © 2016 Holly Klose. All rights reserved.
//

import Foundation

class Character {
    private var _HP = 100
    private var _resistance = 0
    private var _attackPwr = 1
    private var _totalAttackPower = 1
    
    

    
    var HP: Int {
        get {
        return _HP
        }
    }
    var resistance: Int {
        get {
            return _resistance
        }
    }
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var totalAttackPower: Int {
        get {
            return _totalAttackPower
        }
    }
    
    var isAlive: Bool {
        if HP > 0 {
            return true
        } else {
            return false
        }
    }
    
    
 //   init (HP: Int, resistance: Int, attackPwr: Int) {
  //      self._HP = HP
  //      self._resistance = resistance
 //       self._attackPwr = attackPwr
    
 //   }
    
    func attack(attackPwr: Int, attacker: Character) ->Bool{
        attacker._totalAttackPower = Int(arc4random_uniform(10)) + attackPwr - self.resistance
        
        self._HP -= attacker.totalAttackPower
        
        return true
        
    }
    
    func restart() ->Bool{
        _HP = 100
        
        return true
    }
    

    
    
}