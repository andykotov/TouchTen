//
//  GameBehavior.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import Foundation

struct GameBehavior {
    var isGameStarted = false
    var isShowingWebView = false
    var isShowingOnboarding = false
    var countOfTouch = 0
    var touchAimArray = [Int()]
    var timerCount = Int()
    var url = String()
    
    var isLoading = false
    var canGoBack = false
    var shouldGoBack = false
    var title: String = ""
}
