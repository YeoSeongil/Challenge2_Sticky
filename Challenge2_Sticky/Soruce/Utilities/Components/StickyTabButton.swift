//
//  StickyTabButton.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

struct StickyTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.h5)
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundStyle(isSelected ? .black : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.mainYellow : Color.gray.opacity(0.1))
                )
        }
    }
}

#Preview {
    HStack {
        StickyTabButton(title: "전체", isSelected: true, action: { })
        StickyTabButton(title: "화남", isSelected: false, action: { })
        StickyTabButton(title: "부끄러움", isSelected: false, action: { })
    }
}
