//
//  MainReducer.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI

final class MainReducer: ObservableObject {
    @Published private(set) var state = MainState()
    
    func reduce(_ intent: MainIntent)  {
        switch intent {
        case .stickyTabButtonTapped(let type):
            state.selectedType = type
            
        case .navigationButtonTapped:
            state.isNavigated = true
            
        case .resetIsNavigated:
            state.isNavigated = false
        }
    }
}
