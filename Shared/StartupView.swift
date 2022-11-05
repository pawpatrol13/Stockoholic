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
            "Apple", "Tesla", "Twitter", "Mircosoft"
        ]
        var body: some View {
            NavigationView {
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
                            .navigationTitle("Start-up")
                        }
                    }
                    
                }
            }
            
        }
    }
    
    struct StartupView_Previews: PreviewProvider {
        static var previews: some View {
            StartupView()
        }
    }
