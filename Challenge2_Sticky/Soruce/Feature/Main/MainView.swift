//
//  MainView.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

struct MainView: View {
    // Mock Data
    private let mockSticky: [Sticky] = Sticky.mockSticky
    
    @StateObject private var reducer: MainReducer
    
    init() {
        _reducer = StateObject(wrappedValue: MainReducer())
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.clear.ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(StickyTabButtonType.allCases, id: \.self) { type in
                                StickyTabButton(
                                    title: type.buttonTitle,
                                    isSelected: reducer.state.selectedType == type
                                ) {
                                    reducer.reduce(.stickyTabButtonTapped(type))
                                }
                            }
                        }
                    }.padding(.bottom, 24)
                    
                    List {
                        ForEach(mockSticky, id: \.self) { item in
                            StickyCell(sticky: item)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        
                                    } label: {
                                        Label("삭제", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal, -20)
                    .padding([.leading, .trailing], 0)
                }
            }
            .padding(.horizontal,16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        reducer.reduce(.navigationButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            .navigationDestination(isPresented: Binding(
                get: { reducer.state.isNavigated },
                set: { if !$0 { reducer.reduce(.resetIsNavigated) }}))
            {
                AddStickyView()
            }
        }
    }
}

#Preview {
    MainView()
}
