//
//  StartupDataView.swift
//  Stockoholic
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView5: View {
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


@available(iOS 16.0, *)
struct StartupDataView: View {
    @State private var showingSheet5 = false
    @State private var startUpAmount = 0.0
    @available(iOS 16.0, *)
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                HStack{
                    VStack{
                        Button {
                            showingSheet5.toggle()
                        } label: {
                            Image(systemName:  "text.book.closed")
                                .font(.title)
                        }
                        .sheet(isPresented: $showingSheet5) {
                            SheetView5()
                        }
                        .padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            }
            VStack   {
                Text("Tesla Coils")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        .foregroundColor(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                    Image(systemName: "chart.xyaxis.line")
                        .font(.system(size: 180))
                }
                VStack {
                    Text("Tesla Coils")
                        .font(.largeTitle)
                        .font(Font.body.bold())
                    VStack {
                        Text("Price paying :")
                            .font(Font.body.bold())
                        VStack {
                            TextField("Amount", value: $startUpAmount, format: .currency(code: Locale.current.currencyCode ?? "SGD"))
                                .keyboardType(.decimalPad)
                                .listRowBackground(Color(UIColor.systemGroupedBackground))
                                .cornerRadius(10)
                                .frame(width: 350, height: 60)
                                .foregroundColor(.white)
                                .background(Color("ForegroundColor"))
                                .cornerRadius(10)
                            
                            
                            VStack {
                                Text("Quanity :")
                                    .font(Font.body.bold())
                            }
                            VStack {
                                
                                TextField("Amount", value: $startUpAmount, format: .currency(code: Locale.current.currencyCode ?? "SGD"))
                                    .keyboardType(.decimalPad)
                                    .frame(width: 350, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color("ForegroundColor"))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                VStack {
                    HStack {
                        Button {
                            print("buy")
                        }label: {
                            Text("Invest")
                                .frame(width: 100, height: 30)
                                .padding()
                                .background(.green)
                                .cornerRadius(10)
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Start-ups")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Start-ups")
                            .font(.system(size: 60))
                            .foregroundColor(Color.white)
                    }
                }
                
            }
        }
    }
}
struct StartupDataView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            StartupDataView()
                .preferredColorScheme(.dark)
        } else {
            // Fallback on earlier versions
        }
    }
}
