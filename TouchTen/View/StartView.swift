//
//  StartView.swift
//  TouchTen
//
//  Created by mr. Hakoda on 18.08.2021.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                if model.gameBehavior.isGameStarted {
                    Aim(geo: geo)
                } else {
                    VStack {
                        Spacer()
                        
                        Text("Touch Ten")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding()
                        
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                model.gameBehavior.isGameStarted = true
                                startTimer()
                            }) {
                                Text("Start Game")
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
                
                NavigationLink(destination:  WebViewContainer(model: model)
                                .navigationBarTitle(Text(model.gameBehavior.title), displayMode: .inline)
                                .navigationBarItems(leading: Button(action: {
                                    model.gameBehavior.shouldGoBack.toggle()
                                }, label: {
                                    if model.gameBehavior.canGoBack {
                                        Image(systemName: "arrow.left")
                                            .frame(width: 44, height: 44, alignment: .center)
                                    } else {
                                        EmptyView()
                                            .frame(width: 0, height: 0, alignment: .center)
                                    }
                                })
                                ), isActive: $model.gameBehavior.isShowingWebView) { EmptyView() }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $model.gameBehavior.isShowingOnboarding) {
                Onboarding()
            }
            .onAppear(perform: {
                if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                    UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    model.gameBehavior.isShowingOnboarding = true
                }
            })
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            model.gameBehavior.timerCount += 1

            if model.gameBehavior.timerCount >= 7 {
                timer.invalidate()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
