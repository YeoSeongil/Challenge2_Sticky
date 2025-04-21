//
//  Sticky.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/21/25.
//

import SwiftUI
import SwiftData

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
