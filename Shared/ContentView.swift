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
                        .padding()
                        
                    }
                    HStack {
                        VStack {
                            Text("Account Balance")
                                .padding()
                                .font(.largeTitle)
                            Text("$100000")
                                .padding()
                                .font(.title)
                                .foregroundColor(.green)
                        }
                        .frame(width: 210, height: 260)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        .cornerRadius(10)
                        VStack {
                            Text("Networth")
                                .padding()
                                .font(.largeTitle)
                            Text("$100000")
                                .padding()
                                .font(.title)
                                .foregroundColor(.green)
                        }
                        .frame(width: 210, height: 260)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        .cornerRadius(10)
                    }
                    .padding()
                    VStack {
                        Text("Asset Owned")
                            .font(.largeTitle)
                            Text("Apple Stock : 2")
                            Text("Mircosoft Stock : 5")
                            Text("Yahoo Stock : 4")
                        
                    }
                    .padding()
                    .frame(width: 300, height: 130)
                    .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                HStack {
                    HStack {
                        NavigationLink (destination: StockView()) {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                        }
                        .padding()
                        NavigationLink (destination: StartupView()) {
                            Image(systemName: "person.3.sequence.fill")
                        }
                        .padding()
                        NavigationLink (destination: ShopView()) {
                            Image(systemName: "cart")
                        }
                        .padding()
                        NavigationLink (destination: ProgressView()) {
                            Image(systemName: "flame")
                        }
                        .padding()
                    }
                    .frame(width: 430)
                    .font(.largeTitle)
                    .border(Color("TextColor"), width: 5)
                    .foregroundColor(Color("TextColor"))
                    .cornerRadius(10)
                }
                .position(x: 230, y: 832)
                
                ZStack {
                    HStack{
                        VStack{
                            Button {
                                showingSheet.toggle()
                            } label: {
                                Image(systemName:  "text.book.closed")
                                    .font(.title)
                                    .position(x: 29, y: 0)
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

