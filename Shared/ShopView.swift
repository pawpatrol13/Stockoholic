//
//  ShopView.swift
//  Stockoholic
//
//  Created by T Krobot on 14/11/22.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(" 1")
                        .font(.largeTitle)
                    Text("Human")
                        .font(.largeTitle)
                        .padding()
                    Text("$Amount")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.title)
                    
                    
                    Spacer()
                }
                .border(Color("TextColor"), width: 5)
                
                HStack {
                    Text(" 1")
                        .font(.largeTitle)
                    Text("Human")
                        .font(.largeTitle)
                        .padding()
                    Text("$Amount")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.title)
                    
                    Spacer()
                }
                .border(Color("TextColor"), width: 5)
                HStack {
                    Text(" 1")
                        .font(.largeTitle)
                    Text("Human")
                        .font(.largeTitle)
                        .padding()
                    Text("$Amount")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.title)
                    Spacer()
                }
                .border(Color("TextColor"), width: 5)
                HStack {
                    Text(" 1")
                        .font(.largeTitle)
                    Text("Human")
                        .font(.largeTitle)
                        .padding()
                    Text("$Amount")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.title)
                    Spacer()
                }
                .border(Color("TextColor"), width: 5)
                Spacer()
            }
        }
        .navigationBarTitle("Shop")
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .preferredColorScheme(.dark)
    }
}
