//
//  StickyTagButton.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI

struct StickyTagButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    init(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void)
    {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    
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
    StickyTagButton(title: "화남", isSelected: true) { }
    StickyTagButton(title: "부끄러움", isSelected: false) { }
}

