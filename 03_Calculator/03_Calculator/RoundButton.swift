//
//  RoundButton.swift
//  03_Calculator
//
//  Created by Seydoux on 2021/11/15.
//

import UIKit

//  IBDesignable => 스토리보드에서 새로 랜더링 가능
@IBDesignable
class RoundButton: UIButton {
    // IBInspectable => 스토리보드에서 값 확인/변경 가능
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
