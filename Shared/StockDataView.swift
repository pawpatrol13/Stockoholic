//
//  StockDataView.swift
//  Stockoholic
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView3: View {
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


struct StockDataView: View {
    @State private var quantityOfStock = 0.0
    @State private var showingSheet3 = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                HStack{
                    VStack{
                        Button {
                            showingSheet3.toggle()
                        } label: {
                            Image(systemName:  "text.book.closed")
                                .font(.title)
                        }
                        .sheet(isPresented: $showingSheet3) {
                            SheetView3()
                        }
                        .padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            }
            VStack   {
                Text("Apple")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        .foregroundColor(Color("BackgroundColor"))
                    Image(systemName: "chart.xyaxis.line")
                        .font(.system(size: 180))
                }
                VStack {
                    Text("Apple")
                        .font(.largeTitle)
                        .font(Font.body.bold())
                    VStack {
                        Text("Quantity:")
                            .font(Font.body.bold())
                            .padding()
                    }
                    VStack {
                        TextField("Quantity", value: $quantityOfStock, format: .number)
                            .keyboardType(.decimalPad)
                            .frame(width: 250, height: 60)
                            .foregroundColor(.white)
                            .background(Color("ForegroundColor"))
                            .cornerRadius(10)
                    }
                    VStack {
                        Text("Price:")
                            .font(Font.body.bold())
                            .padding()
                    }
                    VStack {
                        TextField("Price", value: $quantityOfStock, format: .currency(code: Locale.current.currencyCode ?? "SGD"))
                            .keyboardType(.decimalPad)
                            .frame(width: 250, height: 60)
                            .foregroundColor(.white)
                            .background(Color("ForegroundColor"))
                            .cornerRadius(10)
                    }
                    
                    VStack {
                        HStack {
                            Button {
                                print("buy")
                            }label: {
                                Text("Buy")
                                    .frame(width: 100, height: 30)
                                    .padding()
                                    .background(.green)
                                    .cornerRadius(10)
                                    .foregroundColor(Color("BackgroundColor"))
                            }
                            Button {
                                print("sell")
                            }label: {
                                Text("Sell")
                                    .frame(width: 100, height: 30)
                                    .padding()
                                    .background(.red)
                                    .cornerRadius(10)
                                    .foregroundColor(Color("BackgroundColor"))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Stocks")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Stocks")
                            .font(.system(size: 60))
                            .foregroundColor(Color.white)
                    }
                }
                
            }
            Spacer()
        }
    }
}


struct StockDataView_Previews: PreviewProvider {
    static var previews: some View {
        StockDataView()
            .preferredColorScheme(.dark)
    }
}
