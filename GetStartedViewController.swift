//
//  GetStartedViewController.swift
//  EZBook
//
//  Created by Paing Zay on 12/11/23.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationItem.title = "Easy Book"
        title = "Easy Book"
    }
    
    
    @IBAction func getStarted(_ sender: UIButton) {
        print("Tapped")
        performSegue(withIdentifier: "GoToHome", sender: self)
    }
    
}
