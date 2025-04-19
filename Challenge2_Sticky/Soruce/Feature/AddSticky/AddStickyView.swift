//
//  AddStickyView.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/19/25.
//

import SwiftUI

struct AddStickyView: View {
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isFocusedTitle: Bool
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
                                                    isSelected: reducer.state.selectedType == type)
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
                        print("123")
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

#Preview {
    AddStickyView()
}
