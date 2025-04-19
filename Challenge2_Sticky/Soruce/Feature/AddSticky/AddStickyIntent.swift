//
//  AddStickyIntent.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI
import PhotosUI

enum AddStickyIntent {
    case updateTitleText(String)
    case updateContentText(String)
    case updateSelectedImage(PhotosPickerItem?)
    case updateCurrentImage(UIImage?)
    case validateTextLength(TextFieldType)
    case stickyTagButtonTapped(StickyType)
    case updateStickyButton(Bool)
    //case addStickyButtonTapped
}
