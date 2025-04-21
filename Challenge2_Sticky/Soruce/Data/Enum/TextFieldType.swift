//
//  TextFieldType.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

enum TextFieldType {
    case title
    case place
    case content
    
    var maxLength: Int {
        switch self {
        case .title: return 15
        case .place: return 10
        case .content: return 100
        }
    }
}
