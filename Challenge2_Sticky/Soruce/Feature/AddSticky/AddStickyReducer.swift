//
//  AddStickyReducer.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI

final class AddStickyReducer: ObservableObject {
    @Published private(set) var state = AddStickyState()
    
    func reduce(_ intent: AddStickyIntent) {
        switch intent {
        case .updateTitleText(let title):
            state.title = title
            updateValidationState()
            
        case .updateContentText(let content):
            state.content = content
            updateValidationState()
            
        case .validateTextLength(let type):
            switch type {
            case .title:
                if state.title.count > type.maxLength {
                    state.title = String(state.title.prefix(type.maxLength))
                }
                
            case .content:
                if state.content.count > type.maxLength {
                    state.content = String(state.content.prefix(type.maxLength))
                }
            }
            
        case .stickyTagButtonTapped(let type):
            state.selectedType = type
            
        case .updateSelectedImage(let image):
            state.selectedImage = image
            
        case .updateCurrentImage(let image):
            state.currentImage = image
            updateValidationState()
            
        case .updateStickyButton(let vaild):
            state.isVaildNextButton = vaild
        }
    }
}

extension AddStickyReducer {
    private func updateValidationState() {
        let isTitleValid = !state.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isContentValid = !state.content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        let isImageValid = state.currentImage != nil
        state.isVaildNextButton = isTitleValid && isContentValid && isImageValid
    }
}
