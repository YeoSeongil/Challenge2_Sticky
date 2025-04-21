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
            if let uiImage = UIImage(data: sticky.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 144)
                    .clipShape(.rect(cornerRadius: 5))
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 144)
                    .clipShape(.rect(cornerRadius: 5))
            }
                
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
