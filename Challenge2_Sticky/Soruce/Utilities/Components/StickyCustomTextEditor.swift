//
//  StickyCustomTextEditor.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI

struct StickyCustomTextEditor: View {
    @Binding var text: String
    
    let placeholder: String
    let font: Font
    let lineHeight: CGFloat
    let padding: CGFloat

    private var numberOfLines: Int {
        let lines = text.components(separatedBy: "\n")
        return max(1, lines.count)
    }
    
    private var dynamicHeight: CGFloat {
        return CGFloat(numberOfLines) * lineHeight + padding
    }
    
    init(
         placeholder: String,
         font: Font,
         lineHeight: CGFloat,
         padding: CGFloat,
         text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.font = font
        self.lineHeight = lineHeight
        self.padding = padding
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .font(font)
                .frame(height: dynamicHeight)
                .lineSpacing(4)
                .padding(.leading, 4)
                .scrollContentBackground(.hidden)
            
            if text.isEmpty {
                Text(placeholder)
                    .font(font)
                    .foregroundColor(.gray.opacity(0.7))
                    .padding(7)
                    .background(Color.clear)
                    .allowsHitTesting(false)
            }
        }
        .padding(.vertical, 5)
        .animation(.easeOut(duration: 0.2), value: dynamicHeight)
    }
}

#Preview {
    StickyCustomTextEditor(placeholder: "입력하세요!", font: .body5, lineHeight: 24, padding: 12, text: .constant(""))
}
