//
//  StickerType.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

enum StickyType: String, Identifiable, CaseIterable {
    case angry = "화남"
    case dizzy = "어이없음"
    case embarrassed = "부끄러운"
    
    var id: String { self.rawValue }

    var color: Color {
        switch self {
        case .angry:
            return .red
        case .dizzy:
            return .yellow
        case .embarrassed:
            return .blue
        }
    }
    
    var buttonTitle: String {
        return rawValue
    }
}
