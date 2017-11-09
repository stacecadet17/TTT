//
//  ViewController.swift
//  TTT
//
//  Created by Stacey Abbott on 11/6/17.
//  Copyright © 2017 Stacey Abbott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var blockOne: UIButton!
    @IBOutlet weak var blockTwo: UIButton!
    @IBOutlet weak var blockThree: UIButton!
    @IBOutlet weak var blockFour: UIButton!
    @IBOutlet weak var blockFive: UIButton!
    @IBOutlet weak var blockSix: UIButton!
    @IBOutlet weak var blockSeven: UIButton!
    @IBOutlet weak var blockEight: UIButton!
    @IBOutlet weak var blockNine: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var pressedBlocks = [Int]()
    var colors = ["grey","grey","grey","grey","grey","grey","grey","grey","grey"]
    
    var b1 = false
    var b2 = false
    var b3 = false
    var b4 = false
    var b5 = false
    var b6 = false
    var b7 = false
    var b8 = false
    var b9 = false
    var turn = 1;
    
    //action
    @IBAction func pressedButton(_ sender: UIButton) {
        if notPressed(arr: pressedBlocks, spot: sender.tag){
            pressedBlocks.append(sender.tag)
            if turn == 1{
                sender.backgroundColor = UIColor.red
                colors[sender.tag - 1] = "red"
                turn = 2
                checkGame(position: sender.tag,color: "red")
            }else{
                sender.backgroundColor = UIColor.blue
                colors[sender.tag - 1] = "blue"
                turn = 1
                checkGame(position: sender.tag, color: "blue")
            }
        }
    }
    
    func notPressed(arr: [Int], spot: Int) -> Bool{
        for i in 0..<arr.count {
            if arr[i] == spot{
                return false
            }
        }
        return true;
    }
    
    func checkGame(position: Int, color: String){
        
        //CHECK FROM BOTTOM TO TOP
        if position - 6 >= 1 && position - 6 <= 3{
            if colors[position - 1 - 3] == color && colors[position - 1 - 6] == color{
                gameOver(color: color)
            }
        }
        
        //checks from top to bottom
        if position + 6 >= 7 && position + 6 <= 9{
            if colors[position - 1 + 3] == color && colors[position - 1 + 6] == color{
                gameOver(color: color)
            }
        }
        
        //checks from left to right
        if (position + 2) % 3 == 0{
            if colors[position - 1 + 2] == color && colors[position - 1 + 1] == color{
                gameOver(color: color)
            }
        }
        
        //checks from right to left
        if (position - 2) == 1 || (position - 2) == 4 || (position - 2) == 7 {
            if colors[position - 1 - 2] == color && colors[position - 1 - 1] == color{
                gameOver(color: color)
            }
        }
        
        //checks above and below
        if (position - 3) >= 1 && (position - 3) <= 3{
            if colors[position - 1 - 3] == color && colors[position - 1 + 3] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal bottom to top-right
        if (position - 4) == 3{
            if colors[position - 1 - 2] == color && colors[position - 1 - 4] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal top to bottom-left
        if (position + 4) == 7{
            if colors[position - 1 + 2] == color && colors[position - 1 + 4] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal top to bottom-right
        if (position + 8) == 9{
            if colors[position - 1 + 4] == color && colors[position - 1 + 8] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal bottom to top-left
        if (position - 8) == 1{
            if colors[position - 1 - 4] == color && colors[position - 1 - 8] == color{
                gameOver(color: color)
            }
        }
        
        //checks diagonal middle in all directions
        if (position - 2) == 3{
            if colors[position - 1 - 2] == color && colors[position - 1 + 2] == color{
                gameOver(color: color)
            }else if colors[position - 1 - 4] == color && colors[position - 1 - 2] == color{
                gameOver(color: color)
            }
        }
        
    }
    
    func gameOver(color:String){
        winnerLabel.text = "\(color) wins"
        winnerLabel.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

