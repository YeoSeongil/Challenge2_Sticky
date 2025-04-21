//
//  Sticker.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/21/25.
//

import SwiftUI
import SwiftData

@Model
final class Sticker {
    @Attribute(.unique) var id: UUID
    var stickerNumber: Int
    var isSelected: Bool
    
    init(
        stickerNumber: Int)
    {
        self.id = UUID()
        self.stickerNumber = stickerNumber
        self.isSelected = false
    }
}
