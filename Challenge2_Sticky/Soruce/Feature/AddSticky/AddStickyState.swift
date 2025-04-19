//
//  AddStickyState.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI
import PhotosUI

struct AddStickyState {
    var title: String = ""
    var content: String = ""
    var selectedType: StickyType = .angry
    var selectedImage: PhotosPickerItem? = nil
    var currentImage: UIImage? = nil
    var isVaildNextButton: Bool = false
}
