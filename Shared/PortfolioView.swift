//
//  Portfoilio View .swift
//  Stockoholic
//
//  Created by T Krobot on 16/11/22.
//

import SwiftUI


struct PortfolioView: View {
    @State private var showingSheet = false
    @State var netWorth = 0
    @AppStorage("itemsValue") var itemsValue = 0
    @AppStorage("level") var level = 0
    @AppStorage("cash") var cash = 1000
    @State private var ownedItems: [String] = UserDefaults.standard.object(forKey: "ownedItems") as? [String] ?? [""]
    @State var show = false
    @State var stockSelected = 1
    @State var sharesToSell = 1
    @State var sureSell = false
    
    @State var ferrariCheck = false
    @State var lamCheck = false
    @State var familyCheck = false
    @State var condoCheck = false
    @State var bungalowCheck = false
    
    @State var notEnoughShares = false
    @AppStorage("ferrariPrice") var ferrariPrice = 250000
    @AppStorage("lamPrice") var lamPrice = 350000
    @AppStorage("familyPrice") var familyPrice = 500000
    @AppStorage("condoPrice") var condoPrice = 1500000
    @AppStorage("bungalowPrice") var bungalowPrice = 10000000
    @State var sharesSold = false
    
    @ObservedObject var stockManager = StockManager()

    var body: some View {
        NavigationView {
            List {
                Group {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Image(systemName:"person.crop.circle")
                                .font(.system(size: 90))
                            
                            
                            Spacer()
                            Text("Level: \(level)")
                                .font(.title2)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                            Text("Cash: $\(cash)")
                                .font(.title2)
                                .fontWeight(.light)
                            Spacer()
                            
                            Text("Assets: $\(netWorth)")
                                .font(.title2)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        Spacer()
                    }
                    Section {
                        VStack{
                            Spacer()
                        HStack {
                            Spacer()
                            Text("Shares Owned")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                            Spacer()
                        HStack {
                            Spacer()
                            VStack{
                                HStack{
                                    Text("Dusk Motors, Inc:")
                                    Spacer()
                                    Text("\(stockManager.stocks[0].stocksOwned)  ")
                                }
                                HStack{
                                    Text("Music Max, Inc:")
                                    Spacer()
                                    Text("\(stockManager.stocks[1].stocksOwned)  ")
                                }
                                HStack{
                                    Text("FurniWear, Inc:")
                                    Spacer()
                                    Text("\(stockManager.stocks[2].stocksOwned)  ")
                                }
                                HStack{
                                    Text("Beats Entertainment LLC:")
                                    Spacer()
                                    Text("\(stockManager.stocks[3].stocksOwned)  ")
                                }
                                HStack{
                                    Text("Jack's Beef:")
                                    Spacer()
                                    Text("\(stockManager.stocks[4].stocksOwned)  ")
                                }
                                HStack{
                                    Text("Laurene & Co:")
                                    Spacer()
                                    Text("\(stockManager.stocks[5].stocksOwned)  ")
                                }
                                HStack{
                                    Text("Georgian Air:")
                                    Spacer()
                                    Text("\(stockManager.stocks[6].stocksOwned)  ")
                                }

                            }
                            Spacer()
                        }
                            Spacer()
                    }
                    }
                    
                    Section {
                        VStack{
                        HStack {
                            Spacer()
                            Text("Items Owned")
                                .fontWeight(.bold)
                                .font(.title2)
                            Spacer()
                        }
                        
                        ForEach(ownedItems, id: \.self) { item in
                            HStack {
                                
                                
                                if item == "ferrari" {
                                    Text("Ferrari")
                                    Spacer()
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.red)
                                    
                                }
                                
                                if item == "lam" {
                                    Text("Lamborghini")
                                    Spacer()
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.yellow)
                                }
                                
                                
                                if item == "family" {
                                    Text("Family Estate")
                                    Spacer()
                                    Image(systemName: "house.fill")
                                        .foregroundColor(Color("FamilyEstate"))
                                }
                                
                                
                                if item == "condo" {
                                    Text("Condominium")
                                    Spacer()
                                    Image(systemName: "house.fill")
                                        .foregroundColor(.cyan)
                                }
                                
                                
                                if item == "bungalow" {
                                    Text("Bungalow")
                                    Spacer()
                                    Image(systemName: "music.note.house.fill")
                                        .foregroundColor(.brown)
                                }
                                
                                
                                if item == "mansion" {
                                    Text("Mega Mansion")
                                    Spacer()
                                    Image(systemName: "cablecar.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding([.leading, .trailing],10)
                        }
                    }
                        
                    }
                }
            }
            .navigationTitle("Portfolio")
            .onAppear {
                
                
                if ownedItems.contains("ferrari") && ferrariCheck == false {
                    netWorth += ferrariPrice
                    ferrariCheck = true
                }
                
                if ownedItems.contains("lam") && lamCheck == false {
                    netWorth += lamPrice
                    lamCheck = true
                }
                
                if ownedItems.contains("family") && lamCheck == false {
                    netWorth += familyPrice
                    lamCheck = true
                }
                
                if ownedItems.contains("condo") && condoCheck == false {
                    netWorth += condoPrice
                    condoCheck = true
                }
                
                if ownedItems.contains("bungalow") && bungalowCheck == false {
                    netWorth += bungalowPrice
                    bungalowCheck = true
                }
            }
        }
    }
}
struct Portfolio_View__Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
