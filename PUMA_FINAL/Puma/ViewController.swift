//
//  ViewController.swift
//  Puma
//
//  Created by Andres Lopez on 11/8/18.
//  Copyright © 2018 Andres Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightArrow: UIImageView!
    
    //Variables para el manejo de apariciones de rightArrow
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Código para la secuencia de apariciones de rightArrow
        rightArrow.isHidden = true
        runTime()
        
    }
    //Comenzar programa
    @IBAction func Start(_ sender: UIButton) {
        performSegue(withIdentifier: "MainView", sender: self)
    }
    
    func runTime()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(arrowAnimation)), userInfo: nil, repeats: true)
    }
    
    @objc func arrowAnimation()
    {
        if counter < 5
        {
            if counter % 2 == 0
            {
                rightArrow.isHidden = false
            }
            else
            {
                rightArrow.isHidden = true
            }
            
            counter += 1
        }
        else
        {
            counter = 0
            rightArrow.isHidden = true
            timer.invalidate()
        }
        
    }
}

