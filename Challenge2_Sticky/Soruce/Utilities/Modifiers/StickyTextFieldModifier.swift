//
//  StickyTextFieldModifier.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI

struct StickyTextFieldModifier: ViewModifier {
    let isFocused: Bool
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(.rect(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke()
                    .foregroundStyle(isFocused ? Color.yellow : Color.clear)
            }
    }
}

extension View {
    func customFocusedStyle(isFocued: Bool, cornerRadius: CGFloat) -> some View {
        modifier(StickyTextFieldModifier(isFocused: isFocued, cornerRadius: cornerRadius))
    }
}
