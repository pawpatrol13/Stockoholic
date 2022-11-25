//
//  ContentView.swift
//  Shared
//
//  Created by Nethan on 30/9/22.
//

import SwiftUI




struct ContentView: View {
    @State private var selection = 1
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }
    
    var body: some View {
        TabView(selection: $selection){
            
            StockView()
                .tabItem{
                    Label("Stocks",systemImage: "chart.xyaxis.line")
                }
                .tag(1)
            PortfolioView()
                .tabItem{
                    Label("Portfolio",systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(2)
            ProgressView()
                .tabItem{
                    Label("Progress",systemImage: "flame")
                }
                .tag(3)
            ShopView()
                .tabItem{
                    Label("Market",systemImage: "cart")
                }
                .tag(4)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

