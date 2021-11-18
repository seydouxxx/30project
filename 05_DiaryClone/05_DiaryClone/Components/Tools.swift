//
//  Tools.swift
//  05_DiaryClone
//
//  Created by Seydoux on 2021/11/16.
//

import Foundation

func dateToString(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: date)
}
