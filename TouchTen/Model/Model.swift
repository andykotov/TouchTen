//
//  Model.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import Foundation

class Model: ObservableObject {
    @Published var gameBehavior = GameBehavior()
    @Published var aimBehavior = AimBehavior()
}
