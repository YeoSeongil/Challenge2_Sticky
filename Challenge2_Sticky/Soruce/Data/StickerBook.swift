//
//  StickyBook.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/21/25.
//

import SwiftUI
import SwiftData

@Model
final class StickerBook {
    @Attribute(.unique) var id: UUID
    var stickyID: UUID
    
    @Relationship(deleteRule: .cascade) var stickers: [Sticker]
    
    init(
        stickyID: UUID)
    {
        self.id = UUID()
        self.stickyID = stickyID
        self.stickers = (1...8).map { Sticker(stickerNumber: $0) }
    }
}
