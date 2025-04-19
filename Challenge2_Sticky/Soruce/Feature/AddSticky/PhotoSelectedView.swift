//
//  PhotoSelectedView.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI
import PhotosUI

struct PhotoSelectedView: View {
    @ObservedObject var reducer: AddStickyReducer
    
    init(reducer: AddStickyReducer) {
        self._reducer = ObservedObject(wrappedValue: reducer)
    }
    
    var body: some View {
        VStack {
            PhotosPicker(selection: Binding(get: { reducer.state.selectedImage },
                                        set: { reducer.reduce(.updateSelectedImage($0)) }))
            {
                ZStack {
                    Color.milkGray
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black.opacity(0.2))
                        }
                    
                    if let image = reducer.state.currentImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 25)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .frame(height: 300)
            .onChange(of: reducer.state.selectedImage) { _ , newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        reducer.reduce(.updateCurrentImage(uiImage))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}
