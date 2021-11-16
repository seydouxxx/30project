//
//  SeguePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by Seydoux on 2021/11/15.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
}
