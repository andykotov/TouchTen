//
//  Onboarding.swift
//  TouchTen
//
//  Created by mr. Hakoda on 19.08.2021.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This game is about reaction. You need to press the button as quickly as possible. You only have 10 touches per round and for a limited time. Good luck!")
                    .font(.subheadline)
                    .padding(10)
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 64, height: 64, alignment: .center)
                    .clipShape(Circle())
                    .animation(
                        Animation.easeInOut(duration: 0.4)
                            .repeatForever()
                    )
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Introducing Touch Ten", displayMode: .inline)
        }
    }
}
