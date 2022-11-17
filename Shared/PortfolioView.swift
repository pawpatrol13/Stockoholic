//
//  Portfoilio View .swift
//  Stockoholic
//
//  Created by T Krobot on 16/11/22.
//

import SwiftUI


struct PortfoilioView: View {
    @State private var showingSheet = false
    @AppStorage("duskPrice") var duskPrice = 50
     @AppStorage("musicPrice") var musicPrice = 80
     @AppStorage("furniPrice") var furniPrice = 120
     @AppStorage("beatsPrice") var beatsPrice = 100
     @AppStorage("jackPrice") var jackPrice = 150
     @AppStorage("laurenePrice") var laurenePrice = 200
     @AppStorage("georgianPrice") var georgianPrice = 45
    @AppStorage("netWorth") var netWorth = 0
    @AppStorage("itemsValue") var itemsValue = 0
    @AppStorage("level") var level = 0
    @AppStorage("cash") var cash = 1000
    @State var show = false
    @State var stockSelected = 1
    @State var sharesToSell = 1
    @State var sureSell = false
    @State var notEnoughShares = false
    @State var sharesSold = false
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0]
    var body: some View {
        NavigationView {
            List {
                
          
                    Group {
                        HStack {
                            Spacer()
                            VStack {
                                
                                Image(systemName: "person")
                                    .font(.system(size: 90))
                           
                                Spacer()
                             
                              
                                Text("Net worth: $\(netWorth)")
                                    .font(.title2)
                                    .fontWeight(.light)
                                Spacer()
                                
                                Text("Value of items owned: $\(itemsValue)")
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
                        Group {
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
                                        
                                        VStack {
                                            Text("Dusk Motors, Inc: \(shares[0])")
                                            Spacer()
                                            Text("Music Max, Inc: \(shares[1])")
                                            Spacer()
                                            Text("FurniWear, Inc: \(shares[2])")
                                            Spacer()
                                        }
                                        Text("Beats Entertainment LLC: \(shares[3])")
                                        Spacer()
                                        
                                        VStack {
                                            Text("Jack's Beef: \(shares[4])")
                                            Spacer()
                                            Text("Laurene & Co: \(shares[5])")
                                            Spacer()
                                            Text("Georgian Air: \(shares[6])")
                                            Spacer()
                                        }
                                    }
                                    
                                    
                                 
                                    
                                }
                                Spacer()
                            }
                        }
                    }
                
                Section {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Sell a Stock")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer()
                        
                        VStack {
                            Picker(selection: $stockSelected, label: Text("Pick Stock")) {
                                Text("Dusk Motors, Inc.").tag(1)
                                Text("Music Max, Inc.").tag(2)
                                Text("FurniWear, Inc.").tag(3)
                                Text("Beats Entertainment, LLC").tag(4)
                                Text("Jack's Beef").tag(5)
                                Text("Laurene & Co.").tag(6)
                                Text("Georgian Air").tag(7)
                            }
                        }
                        Spacer()
                
                        if stockSelected == 1 {
                            Text("Total value: \(duskPrice*sharesToSell)")
                        } else if stockSelected == 2 {
                            Text("Total value: \(musicPrice*sharesToSell)")
                        } else if stockSelected == 3 {
                            Text("Total value: \(furniPrice*sharesToSell)")
                        } else if stockSelected == 4 {
                            Text("Total value: \(beatsPrice*sharesToSell)")
                        } else if stockSelected == 5 {
                            Text("Total value: \(jackPrice*sharesToSell)")
                        } else if stockSelected == 6 {
                            Text("Total value: \(laurenePrice*sharesToSell)")
                        } else if stockSelected == 7 {
                            Text("Total value: \(georgianPrice*sharesToSell)")
                        }
                
                        HStack {
                            Text("\(sharesToSell)")
                            Spacer()
                            Stepper(value: $sharesToSell, in: 1...100000) {
                                Text("share(s) to sell")
                            }
                        }
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }
                    HStack {
                        Spacer()
                    Button("Sell") {
                        sureSell = true
                    }
                    .foregroundColor(.blue)
                    .font(.title3)
                    .alert("Are you sure you wanna sell this stock?", isPresented: $sureSell) {
                        Button("Yes") {
                            
                            if stockSelected == 1 {
                                
                                if shares[0] >= sharesToSell {
                                    cash += duskPrice*sharesToSell
                                    shares[0] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 2 {
                                
                                if shares[1] >= sharesToSell {
                                    cash += musicPrice*sharesToSell
                                    shares[1] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 3 {
                                if shares[2] >= sharesToSell {
                                    cash += furniPrice*sharesToSell
                                    shares[2] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 4 {
                                if shares[3] >= sharesToSell {
                                    cash += beatsPrice*sharesToSell
                                    shares[3] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 5 {
                                if shares[4] >= sharesToSell {
                                    cash += jackPrice*sharesToSell
                                    shares[4] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 6 {
                                if shares[5] >= sharesToSell {
                                    cash += laurenePrice*sharesToSell
                                    shares[5] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            } else if stockSelected == 7 {
                                if shares[6] >= sharesToSell {
                                    cash += georgianPrice*sharesToSell
                                    shares[6] -= sharesToSell
                                    sharesSold = true
                                } else {
                                    notEnoughShares = true
                                }
                            }
                            
                            
                        }
                
                        Button("No") {
                            
                        }
                    } message: {
                        Text("You'll get the current value of these shares deposited into your cash balance immediately.")
                    }
                        
                    .alert("You don't have enough shares", isPresented: $notEnoughShares) {
                        
                    } message: {
                        Text("You're trying to sell more shares than you own in this company.")
                    }
                        
                    .alert("Successfully sold shares", isPresented: $sharesSold) {
                        
                    } message: {
                        Text("Shares for this company has been deducted, and money has been deposited into your account.")
                    }
                        Spacer()
                }
                }
                
            }
            .navigationTitle("Portfolio")
            .onAppear {
                if shares.count < 2 {
                    
                } else {
                    show = true
                }
            
            }
            .navigationBarItems(leading:
                                    
            Button(action: {
                
            }, label: {
                Image(systemName: "questionmark.app.fill")
                    .font(.title2)
                    .foregroundColor(.red)
            })
                                
        
            
            )
        }
    }
    

    
}

struct Portfoilio_View__Previews: PreviewProvider {
    static var previews: some View {
        PortfoilioView()
            .preferredColorScheme(.dark)
    }
}
