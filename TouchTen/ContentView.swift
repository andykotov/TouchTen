//
//  ContentView.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        StartView()
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
