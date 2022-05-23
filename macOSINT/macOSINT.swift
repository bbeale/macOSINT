//
//  macOSINT.swift
//  macOSINT
//
//  Created by Mohammad Azam on 12/24/21.
//

import SwiftUI

@main
struct macOSINT: App {
    var body: some Scene {
        WindowGroup {
            
            let appState = AppState()
            
            HomeScreen()
                .frame(minWidth: 1280, minHeight: 720)
                .environmentObject(appState)
        }
    }
}
