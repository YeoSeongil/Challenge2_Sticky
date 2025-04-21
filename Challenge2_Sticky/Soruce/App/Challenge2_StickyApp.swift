//
//  Challenge2_StickyApp.swift
//  Challenge2_Sticky
//
//  Created by 성일 on 4/18/25.
//

import SwiftUI
import SwiftData

@main
struct Challenge2_StickyApp: App {
    var stickyModelContrainer: ModelContainer = {
        let schema = Schema([
            Sticky.self,
            StickerBook.self,
            Sticker.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("ModelContainer Error \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(stickyModelContrainer)
    }
}
