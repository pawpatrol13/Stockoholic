//
//  Portfoilio View .swift
//  Stockoholic
//
//  Created by T Krobot on 16/11/22.
//

import SwiftUI


struct PortfoilioView: View {
    @AppStorage("new") var new = true
    @State private var showingSheet = false
    @AppStorage("duskPrice") var duskPrice = 50
    @AppStorage("musicPrice") var musicPrice = 80
    @AppStorage("furniPrice") var furniPrice = 120
    @AppStorage("beatsPrice") var beatsPrice = 100
    @AppStorage("jackPrice") var jackPrice = 150
    @AppStorage("laurenePrice") var laurenePrice = 200
    @AppStorage("georgianPrice") var georgianPrice = 45
    @State var netWorth = 0
    @AppStorage("itemsValue") var itemsValue = 0
    @AppStorage("level") var level = 0
    @AppStorage("cash") var cash = 1000
    @State private var ownedItems: [String] = UserDefaults.standard.object(forKey: "ownedItems") as? [String] ?? [""]
    @State private var settingFeature: [String] = UserDefaults.standard.object(forKey: "settings") as? [String] ?? [""]
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
    @State var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0]
    var body: some View {
        NavigationView {
            List {
                
                
                Group {
                    HStack {
                        Spacer()
                        VStack {
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 90))
                            
                            Spacer()
                            
                            
                            Text("Value of items owned: $\(netWorth)")
                                .font(.title2)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                            Text("Level: \(level)")
                                .font(.title2)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                            Text("Cash: $\(cash)")
                                .font(.title2)
                                .fontWeight(.light)
                            
                        }
                        Spacer()
                        
                        
                    }
                    Text("* Value of items owned refers to items from shop. It does not include total value of shares.")
                        .fontWeight(.ultraLight)
                        .font(.caption)
                    Section {
                        Text("* Quit and restart app to see updated shares")
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        HStack {
                            Spacer()
                            Text("Shares Owned")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            VStack {
                                
                                
                                if show == false {
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        VStack {
                                            Text("Dusk Motors, Inc:                    \(shares[0])")
                                            Spacer()
                                            Text("Music Max, Inc:                        \(shares[1])")
                                            Spacer()
                                            Text("FurniWear, Inc:                         \(shares[2])")
                                            Spacer()
                                            
                                            Text("Beats Entertainment LLC:       \(shares[3])")
                                            Spacer()
                                        }
                                        
                                    }
                                    
                                    HStack {
                                        VStack {
                                            Text("Jack's Beef:                              \(shares[4])")
                                            Spacer()
                                            Text("Laurene & Co:                           \(shares[5])")
                                            Spacer()
                                            Text("Georgian Air:                             \(shares[6])")
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                
                                
                                
                                
                            }
                            Spacer()
                        }
                    }
                    
                    Group {
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
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.red)
                                    Spacer()
                                    Text("Ferrari")
                                        .font(.title3)
                                }
                                
                                if item == "lam" {
                                    Image(systemName: "car.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                    Text("Lamborghini")
                                        .font(.title3)
                                }
                                
                                
                                if item == "family" {
                                    Image(systemName: "house.fill")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("Family Estate")
                                        .font(.title3)
                                }
                                
                                
                                if item == "condo" {
                                    Image(systemName: "house.fill")
                                        .foregroundColor(.cyan)
                                    Spacer()
                                    
                                    Text("Condominium")
                                        .font(.title3)
                                }
                                
                                
                                if item == "bungalow" {
                                    Image(systemName: "music.note.house.fill")
                                        .foregroundColor(.brown)
                                    Spacer()
                                    Text("Bungalow")
                                        .font(.title3)
                                }
                                
                                
                                if item == "mansion" {
                                    Image(systemName: "cablecar.fill")
                                        .foregroundColor(.gray)
                                    Text("Mega Mansion")
                                        .font(.title3)
                                }
                                
                                
                                
                                Spacer()
                            }
                        }
                        
                    }
                }
                Section {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Settings")
                                .font(.title2)
                                .fontWeight(.bold)
                            Image(systemName: "gear")
                                .font(.title2)
                            Spacer()
                        }
                        Spacer()
                        ForEach(settingFeature, id: \.self) { feature in
                            HStack {
                                Text("Light Mode")
                                    .font(.title3)
                                Spacer()
                                Image(systemName: "lightswitch.on")
                                Text("Light Mode")
                                    .font(.title3)
                                Spacer()
                                Image(systemName: "lightswitch.on")
                                Text("Light Mode")
                                    .font(.title3)
                                Spacer()
                                Image(systemName: "lightswitch.on")
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
                    
                    if shares.count < 2 {
                        
                    } else {
                        show = true
                    }
                }
            }
            .onAppear {
                if new == true {
                    shares.append(0)
                    shares.append(0)
                    shares.append(0)
                    shares.append(0)
                    shares.append(0)
                    shares.append(0)
                    shares.append(0)
                    
                    new = false
                    
                    
                } else {
                    
                }
            }
            
        }
    }
    
}
struct Portfoilio_View__Previews: PreviewProvider {
    static var previews: some View {
        PortfoilioView()
            .preferredColorScheme(.dark)
    }
}
