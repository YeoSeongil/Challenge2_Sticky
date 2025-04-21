//
//  Sticky.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/21/25.
//

import SwiftUI
import SwiftData

// Q?
// 각 스티키마다 스티커북이 있음
// 스티커는 총 8개이고, isSelected 변수를 통해 선택 됐는지, 안됐는지 관리함
// 모델이 두 개여야 하는지? 관계 설정을 해야하는지?

// Sticker1 ~ 8까지 변수를 만들고, isSelected를 관리할지?
@Model
final class Sticky {
    @Attribute(.unique) var id: UUID
    var title: String
    var tag: String
    var place: String
    var date: Date
    var image: Data
    
    @Relationship(deleteRule: .cascade) var stickerBook: StickerBook?
    
    init(
        id: UUID,
        title: String,
        tag: String,
        place: String,
        date: Date,
        image: Data
    ) {
        self.id = UUID()
        self.title = title
        self.tag = tag
        self.place = place
        self.date = Date()
        self.image = image
        self.stickerBook = StickerBook(stickyID: id)
    }
}
