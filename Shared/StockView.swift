//
//  StockView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct StockView: View {
    @State var searchText = ""
    let Stock = [
        "Apple", "Tesla", "Twitter", "Mircosoft", "Yahoo", "Bank of China", "Google"
    ]
    var body: some View {
        NavigationLink(destination: StockDataView()) {
            ZStack {
                Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
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
                    ZStack {
                        Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                            .edgesIgnoringSafeArea(.all)
                        HStack {
                            List  {
                                ForEach(Stock, id: \.self) { stock in
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
    
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
            .preferredColorScheme(.dark)
    }
    
}
