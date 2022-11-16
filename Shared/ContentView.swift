//
//  ContentView.swift
//  Shared
//
//  Created by Nethan on 30/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            StartupView()
                .tabItem{
                    Label("Start-ups",systemImage: "person.3")
                }
            StockView()
                .tabItem{
                    Label("Stocks",systemImage: "chart.xyaxis.line")
                }
            PortfoilioView()
                .tabItem{
                    Label("Portfolio",systemImage: "list.bullet.rectangle.portrait")
                }
            ProgressView()
                .tabItem{
                    Label("Progress",systemImage: "flame")
                }
            ShopView()
                .tabItem{
                    Label("Shop",systemImage: "cart")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

