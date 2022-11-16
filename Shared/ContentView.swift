//
//  ContentView.swift
//  Shared
//
//  Created by Nethan on 30/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 3
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }
    
    var body: some View {
        TabView(selection: $selection){
            StartupView()
                .tabItem{
                    Label("Start-ups",systemImage: "person.3")
                }
                .tag(1)
            StockView()
                .tabItem{
                    Label("Stocks",systemImage: "chart.xyaxis.line")
                }
                .tag(2)
            PortfoilioView()
                .tabItem{
                    Label("Portfolio",systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(3)
            ProgressView()
                .tabItem{
                    Label("Progress",systemImage: "flame")
                }
                .tag(4)
            ShopView()
                .tabItem{
                    Label("Shop",systemImage: "cart")
                }
                .tag(5)
        }
        .tint(Color("ForegroundColor"))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

