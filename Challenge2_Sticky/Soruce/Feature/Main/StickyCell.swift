//
//  StickyCell.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

struct StickyCell: View {
    let sticky: Sticky
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "camera")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 144)
                .clipShape(.rect(cornerRadius: 5))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(sticky.tag)
                    .font(.h5)
                    .padding(5)
                    .background(Color.mainYellow)
                    .clipShape(.rect(cornerRadius: 6))
                
                Text(sticky.title)
                    .font(.h4)
                
                Text(sticky.place)
                    .font(.body5)
                
                Text(sticky.date.toYearMonthDateFormatting)
                    .font(.body5)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
    }
}

#Preview {
    StickyCell(sticky: .init(title: "배고프다", tag: "화남", place: "포항공대", date: Date(), image: "plus"))
}
