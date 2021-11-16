//
//  CodePresentViewController.swift
//  ScreenTransactionExample
//
//  Created by Seydoux on 2021/11/15.
//

import UIKit

// delegate를 이용한 루트로의 데이터 전달
protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}
class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Seydoux")
        self.dismiss(animated: true, completion: nil)
    }
}
