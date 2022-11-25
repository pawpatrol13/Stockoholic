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
        UINavigationBar.appearance()
        
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
    @State var timeRemainingMinutes = 0
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
                            
                            Spacer()
                            Text("$ \(ferrariPrice)")
                                .foregroundColor(.green)
                                .font(.title)
                                .padding(.top)
                        }
                        VStack {
                            Spacer()
                            Text("Ferrari")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Text("Estimated high: $ \(ferrariHigh)")
                                .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
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
                                    .padding(.top)
                                Spacer()
                                Text("$ \(lamPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .padding(.top)
                            }
                            VStack {
                                Spacer()
                                Text("Lamborghini")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                               Spacer()
                                Text("Estimated high: $ \(lamHigh)")
                                    .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
                }
                Section {
                    Button {
                        sureBuyItem = true
                    } label: {
                        Section {
                            HStack {
                                Image(systemName: "house.fill")
                                    .foregroundColor(Color("FamilyEstate"))
                                    .font(.largeTitle)
                                    .padding(.top)
                                Spacer()
                                Text("$ \(familyPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .padding(.top)
                            }
                            VStack {
                                Spacer()
                                Text("Family Estate")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                                Spacer()
                                Text("Estimated high: $ \(familyHigh)")
                                    .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
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
                                    .padding(.top)
                                Spacer()
                                Text("$ \(condoPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .padding(.top)
                            }
                            VStack {
                                Spacer()
                                Text("Condominium")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                               Spacer()
                                Text("Estimated high: $ \(condoHigh)")
                                    .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
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
                                    .padding(.top)
                                Spacer()
                                Text("$ \(bungalowPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .padding(.top)
                            }
                            VStack {
                                Spacer()
                                Text("Bungalow")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                                Spacer()
                                Text("Estimated high: $ \(bungalowHigh)")
                                    .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
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
                                    .padding(.top)
                                Spacer()
                                Text("$ \(mansionPrice)")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .padding(.top)
                            }
                            VStack {
                                Spacer()
                                Text("Mega Mansion")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("TextColor"))
                                Spacer()
                                Text("Estimated high: $ \(mansionHigh)")
                                    .foregroundColor(Color("Yellow"))
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
                    HStack{
                        Spacer()
                        Text("Item prices change in \(timeRemainingMinutes) min.")
                        Spacer()
                    }
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
            timeRemainingMinutes = timeRemaining/60
        }
    }
}
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
        }
    }
