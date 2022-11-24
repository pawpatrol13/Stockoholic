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
    @AppStorage("ferrariPrice") var ferrariPrice = 250000
    @AppStorage("lamPrice") var lamPrice = 350000
    @AppStorage("familyPrice") var familyPrice = 500000
    @AppStorage("condoPrice") var condoPrice = 1500000
    @AppStorage("bungalowPrice") var bungalowPrice = 10000000
    @AppStorage("mansionPrice") var mansionPrice = 100000000
    @AppStorage("cash") var cash = 1000
    @AppStorage("ferrariHigh") var ferrariHigh = 180000
    @AppStorage("lamHigh") var lamHigh = 270000
    @AppStorage("familyHigh") var familyHigh = 350000
    @AppStorage("mansionHigh") var mansionHigh = 250000000
    @AppStorage("condoHigh") var condoHigh = 1100000
    @AppStorage("bungalowHigh") var bungalowHigh = 7500000
    @State var sureBuyItem = false
    @AppStorage("ferrariLow") var ferrariLow = 120000
    @AppStorage("lamLow") var lamLow = 150000
    @AppStorage("familyLow") var familyLow = 230000
    @AppStorage("mansionLow") var mansionLow = 50000000
    @AppStorage("condoLow") var condoLow = 200000
    @AppStorage("bungalowLow") var bungalowLow = 2500000
    @State var notEnoughMoney = false
    @State private var ownedItems: [String] = UserDefaults.standard.object(forKey: "ownedItems") as? [String] ?? [""]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      @State var timeRemaining = 600
    var body: some View {
        NavigationView {
       
            List {
                Section {
                Button {
                    sureBuyItem = true
                } label: {
                    Section {
                        HStack {
                            
                            Image(systemName: "car.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .padding(.top)
                            Text("Ferrari")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .padding(.top)
                            Spacer()
                            Text("$ \(ferrariPrice)")
                                .foregroundColor(.green)
                                .font(.title)
                                .padding(.top)
                        }
                        VStack {
                            Spacer()
                            Text("Estimated high: $ \(ferrariHigh)")
                                .foregroundColor(.yellow)
                            Spacer()
                            Text("Estimated low: $ \(ferrariLow)")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
                .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                    
                    Button("Yes") {
                        if cash >= ferrariPrice && ownedItems.contains("ferrari") == false {
                            cash -= ferrariPrice
                            ownedItems.append("ferrari")
                            UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                        } else {
                            notEnoughMoney = true
                        }
                    }
                    
                    Button("No") {
                        
                    }
                    
                } message: {
                    Text("Your value of items will change based on this item's price, but you can't resell it.")
                }
                .alert("Error!", isPresented: $notEnoughMoney) {
                    
                } message: {
                    Text("You either don't have enough money to purchase this item or you already own it")
                }
                } footer: {
                    Text("Item prices change every 10 min")
                }
                
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                
                                Image(systemName: "car.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.yellow)
                                Spacer()
                                
                                
                                Text("$ \(lamPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Lamborghini")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                               Spacer()
                                Text("Estimated high: $ \(lamHigh)")
                                    .foregroundColor(.yellow)
                                Spacer()
                                Text("Estimated low: $ \(lamLow)")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                        
                        Button("Yes") {
                            if cash >= lamPrice && ownedItems.contains("lam") == false {
                                cash -= lamPrice
                                ownedItems.append("lam")
                                UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                            } else {
                                notEnoughMoney = true
                            }
                        }
                        
                        Button("No") {
                            
                        }
                        
                    } message: {
                        Text("Your value of items will change based on this item's price, but you can't resell it.")
                    }
                    .alert("Error!", isPresented: $notEnoughMoney) {
                        
                    } message: {
                        Text("You either don't have enough money to purchase this item or you already own it")
                    }
                } footer: {
                    Text("Item prices change every 10 min")
                }
                
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                
                                Image(systemName: "house.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                Spacer()
                                
                                
                                Text("$ \(familyPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Family Estate")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Estimated high: $ \(familyHigh)")
                                    .foregroundColor(.yellow)
                                
                                Spacer()
                                Text("Estimated low: $ \(familyLow)")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                        
                        Button("Yes") {
                            if cash >= familyPrice && ownedItems.contains("family") == false {
                                cash -= familyPrice
                                ownedItems.append("family")
                                UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                            } else {
                                notEnoughMoney = true
                            }
                        }
                        
                        Button("No") {
                            
                        }
                        
                    } message: {
                        Text("Your value of items will change based on this item's price, but you can't resell it.")
                    }
                } footer: {
                    Text("Item prices change every 10 min")
                }
                
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                
                                Image(systemName: "house.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.cyan)
                                Spacer()
                                
                                
                                Text("$ \(condoPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Condominium")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                               Spacer()
                                Text("Estimated high: $ \(condoHigh)")
                                    .foregroundColor(.yellow)
                                Spacer()
                                Text("Estimated low: $ \(condoLow)")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    .alert("Error!", isPresented: $notEnoughMoney) {
                        
                    } message: {
                        Text("You either don't have enough money to purchase this item or you already own it")
                    }
                    .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                        
                        Button("Yes") {
                            if cash >= condoPrice && ownedItems.contains("condo") == false {
                                cash -= condoPrice
                                ownedItems.append("condo")
                                UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                            } else {
                                notEnoughMoney = true
                            }
                        }
                        
                        Button("No") {
                            
                        }
                        
                    } message: {
                        Text("Your value of items will change based on this item's price, but you can't resell it.")
                    }
                } footer: {
                    Text("Item prices change every 10 min")
                }
                
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                
                                Image(systemName: "music.note.house.fill")
                                    .foregroundColor(.brown)
                                    .font(.largeTitle)
                                
                                Spacer()
                                
                                
                                Text("$ \(bungalowPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Bungalow")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Estimated high: $ \(bungalowHigh)")
                                    .foregroundColor(.yellow)
                                Spacer()
                                Text("Estimated low: $ \(bungalowLow)")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    .alert("Error!", isPresented: $notEnoughMoney) {
                        
                    } message: {
                        Text("You either don't have enough money to purchase this item or you already own it.")
                    }
                    .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                        
                        Button("Yes") {
                            if cash >= bungalowPrice && ownedItems.contains("bungalow") == false {
                                cash -= bungalowPrice
                                ownedItems.append("bungalow")
                                UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                            } else {
                                notEnoughMoney = true
                            }
                        }
                        
                        Button("No") {
                            
                        }
                        
                    } message: {
                        Text("Your value of items will change based on this item's price, but you can't resell it.")
                    }
                } footer: {
                    Text("Item prices change every 10 min")
                }
                
                
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                Image(systemName: "cablecar.fill")
                                    .foregroundColor(.gray)
                                    .font(.largeTitle)
                                
                                Spacer()
                                
                                
                                Text("$ \(mansionPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Mega Mansion")
                                    .font(.title)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Estimated high: $ \(mansionHigh)")
                                    .foregroundColor(.yellow)
                                Spacer()
                                Text("Estimated low: $ \(mansionLow)")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
                    .alert("Error!", isPresented: $notEnoughMoney) {
                        
                    } message: {
                        Text("You either don't have enough money to purchase this item or you already own it.")
                    }
                    .alert("Are you sure you wanna buy this item?", isPresented: $sureBuyItem) {
                        
                        Button("Yes") {
                            if cash >= bungalowPrice && ownedItems.contains("mansion") == false {
                                cash -= bungalowPrice
                                ownedItems.append("mansion")
                                UserDefaults.standard.set(ownedItems, forKey: "ownedItems")
                            } else {
                                notEnoughMoney = true
                            }
                        }
                        
                        Button("No") {
                            
                        }
                        
                    } message: {
                        Text("Your value of items will change based on this item's price, but you can't resell it.")
                    }
                } footer: {
                    Text("Item prices change every 10 min")
                }
            }
            .navigationTitle("Market")
        }
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                
                timeRemaining -= 1
               
            } else {
                ferrariPrice = Int.random(in: 100000..<1000000)
                lamPrice = Int.random(in: 120000..<1500000)
                familyPrice = Int.random(in: 12000..<2000000)
                condoPrice = Int.random(in: 250000..<5300000)
                bungalowPrice = Int.random(in: 2500000..<20000000)
                mansionPrice = Int.random(in: 45000000..<350000000)
                
              
                
                
                timeRemaining = 600
                
                //Any other code that should happen after countdown
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
