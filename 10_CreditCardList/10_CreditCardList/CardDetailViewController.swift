//
//  CardDetailViewController.swift
//  10_CreditCardList
//
//  Created by Seydoux on 2021/11/23.
//

import UIKit
import Lottie

class CardDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    var promotionDetail: PromotionDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let animationView = AnimationView(name: "money")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let detail = self.promotionDetail else { return}
        
        titleLabel.text = """
            \(detail.companyName)카드 쓰면
            \(detail.amount)만원 드려요
        """
        
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitDateLabel.text = detail.benefitDate
        benefitDetailLabel.text = detail.benefitDetail
        benefitConditionLabel.text = detail.benefitCondition
    }
}
