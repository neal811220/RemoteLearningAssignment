//
//  ViewController.swift
//  simpleApp
//
//  Created by Neal on 2019/11/17.
//  Copyright © 2019 neal812220. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textArray = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempu.",
                     "Contrary to popular belief, Lorem Ipsum is not simply random text.",
                     "Richard McClintock, a Latin professor at Hampden-Sydney College in",
                     "looked up one of the more obscure Latin words, consectetu",
                     "from a Lorem Ipsum passage, and going through the cites of the wor",
                     "This book is a treatise on the theory of ethics, very popular during the",
                     "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."]
    @IBOutlet weak var middleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bottomButton(_ sender: UIButton) {
        if  let randomText = textArray.randomElement() {
            switch randomText {
            case textArray[0]:
                self.view.backgroundColor = UIColor(red: 69/255, green: 188/255, blue: 245/255, alpha: 1)
            case textArray[1]:
                self.view.backgroundColor = UIColor(red: 214/255, green: 188/255, blue: 245/255, alpha: 1)
            case textArray[2]:
                self.view.backgroundColor = UIColor(red: 210/255, green: 194/255, blue: 54/255, alpha: 1)
            case textArray[3]:
                self.view.backgroundColor = UIColor(red: 210/255, green: 194/255, blue: 239/255, alpha: 1)
            case textArray[4]:
                self.view.backgroundColor = UIColor.darkGray
            case textArray[5]:
                self.view.backgroundColor = UIColor.gray
            case textArray[6]:
                self.view.backgroundColor = UIColor.brown
            default:
                break
            }
            middleLabel.text = randomText
        }
    }
    
    
}

