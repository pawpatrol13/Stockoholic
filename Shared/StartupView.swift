//
//  StartupView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct StartupView: View {
    @State var searchText = ""
    let Startup = [
        " Geniebook", "Carro", "Zenyum", "Syfe", "Advance Intelligence Group  (AIG)", "LingoAce","Spenmo","Cake DeFi","ADDX","Homage"
    ]
    var body: some View {
        ZStack {
            Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                .edgesIgnoringSafeArea(.all)
            NavigationLink(destination: StartupDataView()) {
                VStack(alignment: .leading) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.76862745098, green: 0.83137254902, blue: 0.81176470588))
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search ..", text: $searchText)
                        }
                        
                        .foregroundColor(.gray)
                        .padding(13)
                    }
                    .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                        List {
                            ForEach(Startup, id: \.self) { startup in
                                Text(startup)
                            }
                            .listRowBackground(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                            .frame(width: 300, height: 10)
                            .foregroundColor(.white)
    
                        }

                }
                .navigationTitle("Start-ups")
            }
            
        }
    }
}
    struct StartupView_Previews: PreviewProvider {
        static var previews: some View {
            StartupView()
                .preferredColorScheme(.dark)
        }
    }
