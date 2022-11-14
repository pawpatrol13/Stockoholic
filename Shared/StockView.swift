//
//  StockView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView2: View {
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
struct StockView: View {
    @State private var showingSheet2 = false
    @State var searchText = ""
    let Stock = [
        "Apple", "Tesla", "Twitter", "Mircosoft", "Yahoo", "Bank of China", "Google", "Alphabet", "Amazon", "Meta Platforms", "Nvidia" , "Berkshire Hathaway Class B"
    ]
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                ZStack {
                    HStack{
                        VStack{
                            Button {
                                showingSheet2.toggle()
                            } label: {
                                Image(systemName:  "text.book.closed")
                                    .font(.title)
                            }
                            .sheet(isPresented: $showingSheet2) {
                                SheetView2()
                            }
                            .padding(5)
                        }
                        Spacer()
                    }
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.76862745098, green: 0.83137254902, blue: 0.81176470588))
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search ..", text: $searchText)
                    }
                    
                    .foregroundColor(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                    .padding(13)
                }
                .frame(height: 40)
                .cornerRadius(13)
                .padding()
                
                NavigationLink(destination: StockDataView()) {
                    ZStack {
                        Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                            .edgesIgnoringSafeArea(.all)
                        HStack {
                            List(){
                                ForEach(Stock.filter({ searchText.isEmpty ? true : $0.contains(searchText)}).sorted(), id: \.self) { stock in
                                    Text(stock)
                                        .listRowBackground(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                                        .frame(width: 300, height: 10)
                                        .foregroundColor(.white)
                                    
                                }
                                .navigationTitle("Stocks")
                            }
                        }
                        
                    }
                }
            }
        }
    }
    struct StockView_Previews: PreviewProvider {
        static var previews: some View {
            StockView()
                .preferredColorScheme(.dark)
        }
    }
}
