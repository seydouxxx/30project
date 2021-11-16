//
//  ViewController.swift
//  01_QuotesGenerator
//
//  Created by Seydoux on 2021/11/15.
//


// 컨텐츠 허깅 우선순위가 높으면 크기를 유지, 낮으면 늘어날 수 있음
// 컴프레션 레지스턴스가 높으면 크기 유지, 낮으면 줄어들 수 있음
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes = [
        Quote(content: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다.", name: "벤다이크"),
        Quote(content: "나는 나 자신을 빼 놓고는 모두 안다.", name: "비용"),
        Quote(content: "편견이란 실효성이 없는 의견이다.", name: "암브로스 빌"),
        Quote(content: "분노는 바보들의 가슴속에서만 살아간다.", name: "아인슈타인"),
        Quote(content: "몇 번이라도 좋다! 이 끔찍한 생이여...다시!", name: "니체")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapQutoeGenerator(_ sender: UIButton) {
        let random = Int(arc4random_uniform(5)) // 0~4 사이의 정수 난수 생성
        let quote = quotes[random]
        self.quoteLabel.text = quote.content
        self.nameLabel.text = quote.name
    }
    
}

