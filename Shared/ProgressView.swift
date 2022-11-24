//
//  ProgressView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.orange.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.orange,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
            // 1
                .animation(.easeOut, value: progress)
            
        }
    }
}



struct ProgressView: View {
    @State private var showingSheet6 = false
    @State var progressTitle: Double = 0
    @State var progress: Double = 0
    @AppStorage("level") var level = 0
    @State var done1 = false
    @State var done2 = false
    @State var done3 = false
    @State var done4 = false
    @State var done5 = false
    @AppStorage("cash") var cash = 1000
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0]
    
    var body: some View {
        ZStack {
            
            
            VStack {
                ZStack {
                    // 2
                    CircularProgressView(progress: progress)
                    // 3
                    Text("\(progressTitle, specifier: "%.0f")")
                        .font(.largeTitle)
                        .bold()
                }
                .padding(85)
                
                
                
                NavigationView {
                    List {
                        
                        
                        if cash > 10000 {
                            
                            Section {
                                
                                HStack {
                                    Image("10K 3")
                                        .frame(width: 20, height: 10)
                                    Spacer()
                                    Spacer()
                                    Text("You earned $ 10 000. You're off to a great start!")
                                        .fontWeight(.black)
                                }
                            }
                        }
                        
                        if cash > 100000 {
                            Section {
                                HStack {
                                    Image("100K 2")
                                    Spacer()
                                    Text("You earned $ 100 000. You're on to riches, alright!")
                                        .fontWeight(.black)
                                }
                            }
                        }
                        
                        if cash > 1000000 {
                            Section {
                                HStack {
                                    Image("1M 2")
                                    Spacer()
                                    Text("You earned $ 1 million. You've officially joined the millionaire club.")
                                        .fontWeight(.black)
                                    
                                }
                            }
                        }
                        
                        if cash > 100000000 {
                            Section {
                                
                                HStack {
                                    Image("1B 2")
                                    Spacer()
                                    Text("You earned $ 1 billion. That's pretty insane! Congratulations!")
                                        .fontWeight(.black)
                                }
                            }
                        }
                        
                        if cash > 1000000000000 {
                            Section {
                                
                                HStack {
                                    Image("1T 2")
                                    Spacer()
                                    Text("You earned $ 1 trillion. You're a genius! How'd you even do it?!")
                                        .fontWeight(.black)
                                }
                            }
                        }
                        
                    }
                    .navigationTitle("Achievements")
                }
            }
        }
        .onAppear {
            
            if done1 == false  {
                if cash > 10000 {
                    level += 1
                    progress += 0.2
                    progressTitle += 20
                    done1 = true
                }
            }
            
            if done2 == false {
                if cash > 100000 {
                    level += 1
                    progress += 0.2
                    progressTitle += 20
                    done2 = true
                }
            }
            
            if done3 == false {
                
                if cash > 1000000 {
                    level += 1
                    progress += 0.2
                    progressTitle += 20
                    done3 = true
                }
            }
            
            if done4 == false {
                if cash > 1000000000 {
                    level += 1
                    progress += 0.2
                    progressTitle += 20
                    done4 = true
                }
            }
            
            if done5 == false {
                if cash > 1000000000000 {
                    level += 1
                    progress += 0.2
                    progressTitle += 20
                    done5 = true
                }
            }
        }
    }
    
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .preferredColorScheme(.dark)
    }
}
