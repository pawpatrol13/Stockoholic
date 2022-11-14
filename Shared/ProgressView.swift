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
struct SheetView6: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome to Stockoholic")
                    .font(.title)
                Text("This is a educational paper trading to teach you about the finanical market (e.g stock market and start-ups)")
                    .font(Font.body.bold())
            }
            .padding()
            .foregroundColor(.white)
            .border(Color("TextColor"), width: 5)
            
            VStack {
                Spacer()
                Button("Dismiss") {
                    dismiss()
                }
                .font(.title2)
                .padding()
                .background(Color("ForegroundColor"))
                .cornerRadius(10)
            }
        }
    }
}


struct ProgressView: View {
    @State private var showingSheet6 = false
    @State var progress: Double = 0
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button {
                    showingSheet6.toggle()
                } label: {
                    Image(systemName:  "text.book.closed")
                        .font(.title)
                }
                .sheet(isPresented: $showingSheet6) {
                    SheetView6()
                }
                .position(x: 27, y: 8)
                
            }
            VStack {
                ZStack {
                    // 2
                    CircularProgressView(progress: progress)
                    // 3
                    Text("\(progress * 100, specifier: "%.0f")")
                        .font(.largeTitle)
                        .bold()
                }
                .frame(width: 200, height: 200)
                .padding()
                
                ZStack {
                    Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        VStack {
                            HStack {
                                Text("Your Goals")
                                    .font(.largeTitle)
                                    .padding(20)
                                Spacer()
                            }
                            Text("Hello world")
                                .frame(width: 250, height: 0)
                                .padding(50)
                                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            Text("Hello world")
                                .frame(width: 250, height: 0)
                                .padding(50)
                                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            Text("Hello world")
                                .frame(width: 250, height: 0)
                                .padding(50)
                                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        }
                    }
                    
                }
            }
            .navigationTitle("Your Progress")
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .preferredColorScheme(.dark)
    }
}
