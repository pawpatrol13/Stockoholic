//
//  PortfoiloView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView7: View {
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

struct PortfoilioView: View {
    @State private var showingSheet7 = false
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                HStack{
                    VStack{
                        Button {
                            showingSheet7.toggle()
                        } label: {
                            Image(systemName:  "text.book.closed")
                                .font(.title)
                        }
                        .sheet(isPresented: $showingSheet7) {
                            SheetView7()
                        }
                        .padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            }
            VStack {
                VStack {
                    Text("Portfoilo Value")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 200)
                            .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            .foregroundColor(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                        Text("Graph")
                        
                    }
                    
                    
                }
                VStack {
                    Text("Account Balance")
                        .padding()
                        .font(.largeTitle)
                    Text("$100000")
                        .padding()
                        .font(.title)
                        .foregroundColor(.green)
                }
                .frame(width: 290)
                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                VStack {
                    Text("Networth")
                        .padding()
                        .font(.largeTitle)
                    Text("$100000")
                        .padding()
                        .font(.title)
                        .foregroundColor(.green)
                }
                .frame(width: 290)
                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                VStack {
                    Text("Asset Owned")
                        .font(.largeTitle)
                        .padding()
                    VStack {
                        Text("Apple Stock : 2")
                        Text("Mircosoft Stock : 5")
                        Text("Yahoo Stock : 4")
                    }
                    .frame(width: 300, height: 130)
                    .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                    
                    
                }
                Spacer()
            }
        }
        
        .navigationTitle("Your Portfoilo")
    }
}

struct PortfoiloView_Previews: PreviewProvider {
    static var previews: some View {
        PortfoilioView()
            .preferredColorScheme(.dark)
        
    }
}

