//
//  ViewController.swift
//  LiftLine
//
//  Created by Kittisak Panluea on 23/6/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLB: UILabel!
    
    
    @IBOutlet weak var choiceBtn1: UIButton!
    @IBOutlet weak var choiceBtn2: UIButton!
    
    var storyBrain = StoryBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        guard let choiceFromUserSelected = sender.currentTitle else { return print("Error the title of button is nil") }
        
        storyBrain.checkChoiceFromUser(userChoice: choiceFromUserSelected)
        
        UIView.animate(withDuration: 0.3){
            sender.alpha = 0.5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            UIView.animate(withDuration: 0.3){
                sender.alpha = 1.0
            }
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        storyLB.text = storyBrain.getStoryTitle()
        choiceBtn1.setTitle(storyBrain.getChoiceTitle()[0], for: .normal)
        choiceBtn2.setTitle(storyBrain.getChoiceTitle()[1], for: .normal)
    }
    
}

