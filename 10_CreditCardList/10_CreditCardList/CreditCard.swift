//
//  CreditCard.swift
//  10_CreditCardList
//
//  Created by Seydoux on 2021/11/22.
//

import Foundation

struct CreditCard: Codable {
    let id: Int
    let rank: Int
    let name: String
    let cardImageURL: String
    let promotionDetail: PromotionDetail
    let isSelected: Bool?
}

struct PromotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let condition: String
    let benefitCondition: String
    let benefitDetail: String
    let benefitDate: String
}


//"Item0": {
//    "cardImageURL": "https://www.shinhancard.com/_ICSFiles/afieldfile/2019/04/26/190426_pc_mrlife_cardplate600x380.png",
//    "id": 0,
//    "rank": 1,
//    "name": "신한카드 Mr.Life",
//    "promotionDetail": {
//        "companyName": "신한",
//        "amount": 13,
//        "period": "2023.01.07(목)~2023.01.31(토)",
//        "benefitDate": "2023.03.01(월)이후",
//        "benefitDetail": "현금 10만원",
//        "benefitCondition": "이벤트 카드로 결제한 금액이 합해서 10만원이상 결제",
//        "condition": "온라인 채널을 통해 이벤트 카드를 보유하고, 혜택조건을 충족하신 분"
//    }
//},
