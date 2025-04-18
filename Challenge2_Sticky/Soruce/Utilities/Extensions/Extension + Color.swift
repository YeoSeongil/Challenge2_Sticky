//
//  Extension + Color.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

extension Color {
    init(hexCode: String) {
        var rgb: UInt64 = 0
        
        Scanner(string: hexCode).scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    
    // Main
    static let mainYellow = Color(hexCode: "FFC312")
    static let mainGray = Color(hexCode: "E0E0E0")
    
    // Sub
    static let milkGray = Color(hexCode: "F5F5F5")
}
