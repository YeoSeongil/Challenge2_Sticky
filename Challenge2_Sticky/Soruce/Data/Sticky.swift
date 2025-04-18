//
//  Sticky.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

struct Sticky: Hashable {
    let title: String
    let tag: String
    let place: String
    let date: Date
    let image: String
    
    init(title: String,
         tag: String,
         place: String,
         date: Date,
         image: String
    ) {
        self.title = title
        self.tag = tag
        self.place = place
        self.date = date
        self.image = image
    }
}

extension Sticky {
    static let mockSticky: [Sticky] = [
        Sticky(title: "라면 쏟음", tag: "화남", place: "기숙사", date: Date(), image: "plus"),
        Sticky(title: "신발 짝짝이로 신음", tag: "어이없음", place: "지하철", date: Date(), image: "plus"),
        Sticky(title: "에어팟 물에 빠뜨림", tag: "화남", place: "우리집 주방", date: Date(), image: "plus"),
        Sticky(title: "맥주병 깨버림", tag: "부끄러움", place: "통집", date: Date(), image: "plus"),
        Sticky(title: "에어팟 연결 안됐는데 노래 크게 틈", tag: "부끄러움", place: "메인랩", date: Date(), image: "plus"),
        Sticky(title: "몰라유", tag: "어이없음", place: "몰라유", date: Date(), image: "plus"),
    ]
}
