//
//  Portfoilio View .swift
//  Stockoholic
//
//  Created by T Krobot on 16/11/22.
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
    @State private var showingSheet = false
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(edges: .top)
            
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
                            SheetView7()
                        }
                        .padding(5)
                        .position(x: 37, y: 0)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Portfoilio_View__Previews: PreviewProvider {
    static var previews: some View {
        PortfoilioView()
            .preferredColorScheme(.dark)
    }
}
