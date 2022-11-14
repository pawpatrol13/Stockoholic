//
//  ContentView.swift
//  Shared
//
//  Created by Nethan on 30/9/22.
//

import SwiftUI
struct SheetView: View {
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


struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                VStack (alignment: .center){
                    NavigationLink (destination: PortfoilioView()) {
                        VStack {
                            Image(systemName: "dollarsign.arrow.circlepath")
                            Text("Portfolio")
                        }
                        .frame(width: 100, height: 80)
                        .padding(40)
                        .font(.title3)
                        .foregroundColor(Color("TextColor"))
                        .background(Color("ForegroundColor"))
                        .border(Color("TextColor"), width: 5)
                        .cornerRadius(10)
                    }
                    HStack {
                        NavigationLink (destination: StockView()) {
                            VStack{
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                Text("Stocks")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color("TextColor"))
                            .background(Color("ForegroundColor"))
                            .border(Color("TextColor"), width: 5)
                            .cornerRadius(10)
                        }
                        NavigationLink (destination: StartupView()) {
                            VStack {
                                Image(systemName: "person.3.sequence.fill")
                                Text("Start-ups")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color("TextColor"))
                            .background(Color("ForegroundColor"))
                            .border(Color("TextColor"), width: 5)
                            .cornerRadius(10)
                        }
                    }
                    HStack {
                        NavigationLink (destination: ShopView()) {
                            VStack {
                                Image(systemName: "cart")
                                Text("Shop")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color("TextColor"))
                            .background(Color("ForegroundColor"))
                            .border(Color("TextColor"), width: 5)
                            .cornerRadius(10)
                        }
                        NavigationLink (destination: ProgressView()) {
                            VStack{
                                Image(systemName: "flame")
                                Text("Your Progess")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color("TextColor"))
                            .background(Color("ForegroundColor"))
                            .border(Color("TextColor"), width: 5)
                            .cornerRadius(10)
                        }
                    }
                }
                ZStack {
                    HStack{
                        VStack{
                            Button {
                                showingSheet.toggle()
                            } label: {
                                Image(systemName:  "text.book.closed")
                                    .font(.title)
                            }
                            .sheet(isPresented: $showingSheet) {
                                SheetView()
                            }
                            .padding(5)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

