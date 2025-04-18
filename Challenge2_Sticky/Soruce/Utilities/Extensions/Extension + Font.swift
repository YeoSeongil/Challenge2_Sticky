//
//  Extension + Font.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

extension Font {
    enum Pretendard: String {
        case Regular = "Pretendard-Regular"
        case Medium = "Pretendard-Medium"
        case Semibold = "Pretendard-Semibold"
        case Bold = "Pretendard-Bold"
        case Light = "Pretendard-Light"
    }
    
    static let main: Font = .custom(Pretendard.Bold.rawValue, size: 70)
    static let logo: Font = .custom(Pretendard.Bold.rawValue, size: 24)
    
    // Title
    static let h1: Font = .custom(Pretendard.Semibold.rawValue, size: 32)
    static let h2: Font = .custom(Pretendard.Semibold.rawValue, size: 28)
    static let h3: Font = .custom(Pretendard.Semibold.rawValue, size: 24)
    static let h4: Font = .custom(Pretendard.Semibold.rawValue, size: 20)
    static let h5: Font = .custom(Pretendard.Semibold.rawValue, size: 16)
    static let h6: Font = .custom(Pretendard.Semibold.rawValue, size: 12)
    
    // Body
    static let body1: Font = .custom(Pretendard.Medium.rawValue, size: 32)
    static let body2: Font = .custom(Pretendard.Medium.rawValue, size: 28)
    static let body3: Font = .custom(Pretendard.Medium.rawValue, size: 24)
    static let body4: Font = .custom(Pretendard.Medium.rawValue, size: 20)
    static let body5: Font = .custom(Pretendard.Medium.rawValue, size: 16)
    static let body6: Font = .custom(Pretendard.Medium.rawValue, size: 12)
}
