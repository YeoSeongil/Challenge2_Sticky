//
//  Extension + Date.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//


import Foundation

extension Date {
    var toYearMonthDateFormatting: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
}
