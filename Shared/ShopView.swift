//
//  ShopView.swift
//  Stockoholic
//
//  Created by T Krobot on 14/11/22.
//

import SwiftUI

struct ShopView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        //UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
    }
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(edges: .top)
            VStack {
                HStack {
                    Button {
                        print("deduct amt of money")
                    } label: {
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
                }
                .border(Color("TextColor"), width: 5)
                .cornerRadius(10)
                
                HStack {
                    Button {
                        print("deduct amt of money")
                    } label: {
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
                }
                .border(Color("TextColor"), width: 5)
                .cornerRadius(10)
                HStack {
                    Button {
                        print("deduct amt of money")
                    } label: {
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
                }
                .border(Color("TextColor"), width: 5)
                .cornerRadius(10)
                HStack {
                    Button {
                        print("deduct amt of money")
                    } label: {
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
                }
                .border(Color("TextColor"), width: 5)
                .cornerRadius(10)
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Shop")
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Shop")
                        .font(.system(size: 60))
                        .foregroundColor(Color.white)
                }
            }
            
        }
    }
}
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
                .preferredColorScheme(.dark)
        }
    }
