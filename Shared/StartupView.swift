//
//  StartupView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView4: View {
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


struct StartupView: View {
    @State private var showingSheet4 = false
    @State var searchText = ""
    let Startup = [
        "Geniebook", "Carro", "Zenyum", "Syfe", "Advance Intelligence Group  (AIG)", "LingoAce","Spenmo","Cake DeFi","ADDX","Homage"
    ].sorted()
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                VStack {
                    Button {
                        showingSheet4.toggle()
                    } label: {
                        Image(systemName:  "text.book.closed")
                            .font(.title)
                            .padding()
                    }
                    .sheet(isPresented: $showingSheet4) {
                        SheetView4()
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
                
                if #available(iOS 16.0, *) {
                    NavigationLink(destination: StartupDataView()) {
                        ZStack {
                            Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                                .edgesIgnoringSafeArea(.all)
                            HStack {
                                List  {
                                    ForEach(Startup.filter({ searchText.isEmpty ? true : $0.contains(searchText) }), id: \.self) { startup in
                                        Text(startup)
                                            .listRowBackground(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                                            .frame(width: 300, height: 10)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .navigationTitle("Start-Ups")
                                }
                            }
                            
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
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
