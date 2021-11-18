//
//  CovidStatus.swift
//  08_Covid19_Clone
//
//  Created by Seydoux on 2021/11/18.
//

import Foundation

struct CovidStatus: Codable {
    let korea: CityCovidStatus
    let seoul: CityCovidStatus
    let busan: CityCovidStatus
    let daegu: CityCovidStatus
    let incheon: CityCovidStatus
    let gwangju: CityCovidStatus
    let daejeon: CityCovidStatus
    let ulsan: CityCovidStatus
    let sejong: CityCovidStatus
    let gyeonggi: CityCovidStatus
    let gangwon: CityCovidStatus
    let chungbuk: CityCovidStatus
    let chungnam: CityCovidStatus
    let gyeongbuk: CityCovidStatus
    let gyeongnam: CityCovidStatus
    let jeonbuk: CityCovidStatus
    let jeonnam: CityCovidStatus
    let jeju: CityCovidStatus
}

struct CityCovidStatus: Codable {
    let countryName: String
    let newCase: String
    let totalCase: String
    let recovered: String
    let death: String
    let percentage: String
    let newCcase: String
    let newFcase: String
}
//{
//    "resultCode": "0",
//    "resultMessage": "정상 처리되었습니다.",
//    "korea": {
//        "countryName": "합계",
//        "newCase": "3,187",
//        "totalCase": "402,775",
//        "recovered": "366,089",
//        "death": "3,158",
//        "percentage": "777",
//        "newCcase": "3,163",
//        "newFcase": "24"
//    },
//    "seoul": {
//        "countryName": "서울",
//        "newCase": "1,436",
//        "totalCase": "134,948",
//        "recovered": "119,371",
//        "death": "898",
//        "percentage": "1396",
//        "newCcase": "1,432",
//        "newFcase": "4"
//    },
//    "busan": {
//        "countryName": "부산",
//        "newCase": "103",
//        "totalCase": "14,978",
//        "recovered": "14,028",
//        "death": "174",
//        "percentage": "442",
//        "newCcase": "103",
//        "newFcase": "0"
//    },
//    "daegu": {
//        "countryName": "대구",
//        "newCase": "56",
//        "totalCase": "18,020",
//        "recovered": "17,148",
//        "death": "291",
//        "percentage": "745",
//        "newCcase": "54",
//        "newFcase": "2"
//    },
//    "incheon": {
//        "countryName": "인천",
//        "newCase": "159",
//        "totalCase": "21,813",
//        "recovered": "19,530",
//        "death": "121",
//        "percentage": "741",
//        "newCcase": "157",
//        "newFcase": "2"
//    },
//    "gwangju": {
//        "countryName": "광주",
//        "newCase": "34",
//        "totalCase": "5,694",
//        "recovered": "5,443",
//        "death": "29",
//        "percentage": "393",
//        "newCcase": "33",
//        "newFcase": "1"
//    },
//    "daejeon": {
//        "countryName": "대전",
//        "newCase": "46",
//        "totalCase": "7,965",
//        "recovered": "7,587",
//        "death": "56",
//        "percentage": "544",
//        "newCcase": "46",
//        "newFcase": "0"
//    },
//    "ulsan": {
//        "countryName": "울산",
//        "newCase": "14",
//        "totalCase": "5,542",
//        "recovered": "5,418",
//        "death": "57",
//        "percentage": "488",
//        "newCcase": "14",
//        "newFcase": "0"
//    },
//    "sejong": {
//        "countryName": "세종",
//        "newCase": "16",
//        "totalCase": "1,425",
//        "recovered": "1,376",
//        "death": "2",
//        "percentage": "400",
//        "newCcase": "16",
//        "newFcase": "0"
//    },
//    "gyeonggi": {
//        "countryName": "경기",
//        "newCase": "964",
//        "totalCase": "120,658",
//        "recovered": "108,654",
//        "death": "1,043",
//        "percentage": "899",
//        "newCcase": "956",
//        "newFcase": "8"
//    },
//    "gangwon": {
//        "countryName": "강원",
//        "newCase": "54",
//        "totalCase": "7,750",
//        "recovered": "7,318",
//        "death": "68",
//        "percentage": "502",
//        "newCcase": "53",
//        "newFcase": "1"
//    },
//    "chungbuk": {
//        "countryName": "충북",
//        "newCase": "28",
//        "totalCase": "8,439",
//        "recovered": "8,052",
//        "death": "88",
//        "percentage": "527",
//        "newCcase": "28",
//        "newFcase": "0"
//    },
//    "chungnam": {
//        "countryName": "충남",
//        "newCase": "71",
//        "totalCase": "11,726",
//        "recovered": "10,813",
//        "death": "68",
//        "percentage": "553",
//        "newCcase": "70",
//        "newFcase": "1"
//    },
//    "jeonbuk": {
//        "countryName": "전북",
//        "newCase": "50",
//        "totalCase": "5,798",
//        "recovered": "5,299",
//        "death": "70",
//        "percentage": "321",
//        "newCcase": "50",
//        "newFcase": "0"
//    },
//    "jeonnam": {
//        "countryName": "전남",
//        "newCase": "36",
//        "totalCase": "3,925",
//        "recovered": "3,661",
//        "death": "25",
//        "percentage": "212",
//        "newCcase": "36",
//        "newFcase": "0"
//    },
//    "gyeongbuk": {
//        "countryName": "경북",
//        "newCase": "26",
//        "totalCase": "10,404",
//        "recovered": "9,834",
//        "death": "98",
//        "percentage": "394",
//        "newCcase": "26",
//        "newFcase": "0"
//    },
//    "gyeongnam": {
//        "countryName": "경남",
//        "newCase": "66",
//        "totalCase": "13,971",
//        "recovered": "13,170",
//        "death": "46",
//        "percentage": "418",
//        "newCcase": "66",
//        "newFcase": "0"
//    },
//    "jeju": {
//        "countryName": "제주",
//        "newCase": "23",
//        "totalCase": "3,350",
//        "recovered": "3,156",
//        "death": "8",
//        "percentage": "497",
//        "newCcase": "23",
//        "newFcase": "0"
//    },
//    "quarantine": {
//        "countryName": "검역",
//        "newCase": "5",
//        "totalCase": "6,369",
//        "recovered": "6,231",
//        "death": "16",
//        "percentage": "-",
//        "newCcase": "0",
//        "newFcase": "5"
//    }
//}
