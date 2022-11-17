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
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 30)!]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        //UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
    }
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("Market")
        }
    }
}
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
                .preferredColorScheme(.dark)
        }
    }
