//
//  StickyTabButtonType.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

enum StickyTabButtonType: String, Identifiable, CaseIterable {
    case all = "전체"
    case angry = "화남"
    case dizzy = "어이없음"
    case embarrassed = "부끄러운"
    
    var id: String { self.rawValue }

    var buttonTitle: String {
        return rawValue
    }
}
