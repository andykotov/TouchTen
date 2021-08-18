//
//  TouchTenApp.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import SwiftUI

@main
struct TouchTenApp: App {
    @ObservedObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
