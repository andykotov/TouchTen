//
//  Button.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import WebKit
import SwiftUI

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

struct Aim: View {
    @EnvironmentObject var model: Model
    
    @State private var animationAmount: CGFloat = 1
    
    var geo: GeometryProxy
    let webView = WKWebView()
    
    var body: some View {
        VStack {
            Button(action: {
                if model.gameBehavior.countOfTouch < 9 {
                    self.animationAmount = CGFloat(0.8)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.animationAmount = CGFloat(1)
                    }
                    model.gameBehavior.countOfTouch += 1
                    model.gameBehavior.touchAimArray.append(model.gameBehavior.countOfTouch)
                    model.aimBehavior.aimX = CGFloat.random(in: 64.0...geo.frame(in: .global).maxX - 80.0)
                    model.aimBehavior.aimY = CGFloat.random(in: 64.0...geo.frame(in: .global).maxY - 110.0)
                } else {
                    if model.gameBehavior.timerCount < 7 {
                        model.gameBehavior.url = "https://www.google.com.ua/"
                    } else {
                        model.gameBehavior.url = "https://www.youtube.com/"
                    }
                    
                    model.gameBehavior.isShowingWebView = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        model.gameBehavior.isGameStarted = false
                        model.gameBehavior.countOfTouch = 0
                        model.gameBehavior.touchAimArray = [Int()]
                        model.gameBehavior.timerCount = Int()
                    }
                }
            }) {
                Circle()
                    .fill(model.aimBehavior.colorArray[model.gameBehavior.countOfTouch])
                    .frame(width: 64, height: 64, alignment: .center)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount)
                    .animation(
                        Animation.easeInOut(duration: 0.2)
                    )
                    
            }
            .onAppear(perform: {
                model.aimBehavior.aimX = CGFloat.random(in: 20.0...geo.frame(in: .global).maxX - 100.0)
                model.aimBehavior.aimY = CGFloat.random(in: 20.0...geo.frame(in: .global).maxY - 100.0)
            })
            .offset(x: model.aimBehavior.aimX, y: model.aimBehavior.aimY)
        }
    }
}

