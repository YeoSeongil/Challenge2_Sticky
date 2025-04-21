//
//  AddStickyView.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI
import SwiftData

struct AddStickyView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    @FocusState private var isFocusedTitle: Bool
    @FocusState private var isFocusedPlace: Bool
    @FocusState private var isFocusedContent: Bool
    
    @StateObject private var reducer: AddStickyReducer
    
    init() {
        _reducer = StateObject(wrappedValue: AddStickyReducer())
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear.ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    VStack {
                        HStack {
                            Text("제목")
                                .font(.h4)
                            
                            Spacer()
                            
                            Text("\(reducer.state.title.count)/15")
                                .font(.body5)
                                .foregroundStyle(.gray)
                        }
                        TextField("스티키의 제목을 작성해주세요.",
                                  text: Binding(get: { reducer.state.title },
                                                set: { reducer.reduce(.updateTitleText($0)) })
                        )
                        .focused($isFocusedTitle)
                        .padding(.vertical, 12)
                        .padding(.leading, 7)
                        .background(Color.milkGray)
                        .customFocusedStyle(isFocued: isFocusedTitle, cornerRadius: 8)
                        .onChange(of: reducer.state.title) { reducer.reduce(.validateTextLength(.title)) }
                    }
                    
                    VStack {
                        HStack {
                            Text("장소")
                                .font(.h4)
                            
                            Spacer()
                            
                            Text("\(reducer.state.place.count)/10")
                                .font(.body5)
                                .foregroundStyle(.gray)
                        }
                        TextField("실수를 저지른 장소를 입력해주세요.",
                                  text: Binding(get: { reducer.state.place },
                                                set: { reducer.reduce(.updatePlace($0)) })
                        )
                        .focused($isFocusedPlace)
                        .padding(.vertical, 12)
                        .padding(.leading, 7)
                        .background(Color.milkGray)
                        .customFocusedStyle(isFocued: isFocusedPlace, cornerRadius: 8)
                        .onChange(of: reducer.state.title) { reducer.reduce(.validateTextLength(.place)) }
                    }
                    
                    VStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("내용")
                                    .font(.h4)
                                
                                Spacer()
                                
                                Text("\(reducer.state.content.count)/100")
                                    .font(.body5)
                                    .foregroundStyle(.gray)
                            }
                            StickyCustomTextEditor(placeholder: "스티키 내용을 입력하세요!",
                                                   font: .body5,
                                                   lineHeight: 24,
                                                   padding: 12, text:
                                                    Binding(get: { reducer.state.content },
                                                            set: { reducer.reduce(.updateContentText($0)) })
                            )
                            .focused($isFocusedContent)
                            .background(Color.milkGray)
                            .customFocusedStyle(isFocued: isFocusedContent, cornerRadius: 8)
                            .onChange(of: reducer.state.content) { reducer.reduce(.validateTextLength(.content)) }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("태그")
                            .font(.h4)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(StickyType.allCases, id: \.self) { type in
                                    StickyTabButton(title: type.buttonTitle,
                                                    isSelected: reducer.state.selectedTag == type)
                                    {
                                        reducer.reduce(.stickyTagButtonTapped(type))
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("이미지")
                            .font(.h4)
                        
                        PhotoSelectedView(reducer: reducer)
                    }
                    
                    Button("등록하기") {
                        addSticky()
                    }
                    .font(.h4)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(reducer.state.isVaildNextButton ? Color.mainYellow : Color.gray)
                    .clipShape(.rect(cornerRadius: 8))
                    .disabled(!reducer.state.isVaildNextButton)
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("스티키 만들기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.primary)
                }
            }
        }
    }
}


private extension AddStickyView {
    func addSticky() {
        guard let uiImage = reducer.state.currentImage else { return }
        guard let imageData = uiImage.jpegData(compressionQuality: 0.7) else { return }
        
        let newSticky = Sticky(
            id: UUID(),
            title: reducer.state.title,
            tag: reducer.state.selectedTag.buttonTitle,
            place: reducer.state.place,
            date: Date(),
            image: imageData
        )
        
        modelContext.insert(newSticky)
        
        dismiss()
    }
}
#Preview {
    AddStickyView()
}
