//
//  StockView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//
import Foundation
import SwiftUI
import Charts



var upOrDowns = [false, true]
struct Stockie: Identifiable {
    let id = UUID()
    
    let name: String
    let price: Int
    let upOrDown: Bool
    let marketCap: String
    let lowestToday: String
    let highestToday: String
    let num: Int
}



struct StockRow: View {
    @State var sharesOwned = []
    var stock: Stockie
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                
                Spacer()
                
                Text("\(stock.name)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Spacer()
                
                
                
                
            }
            Spacer()
            HStack {
                Spacer()
                Text("Market Cap: $ \(stock.marketCap)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                Spacer()
                
            }
            Spacer()
            
            
        }
    }
}
struct StockView: View {
    @AppStorage("new") var new = true
    @State var showStock = false
    @State var searchText = ""
    @AppStorage("cash") var cash = 1000
    
    @State var buyShares = false
    @State var numie = 0
    @State var sureBuy = false
    @State var sharesBuying = 1
    @State var companySelected = ""
    @State var price = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 20
    
    // prices
    @AppStorage("duskPrice") var duskPrice = 50
    @AppStorage("musicPrice") var musicPrice = 80
    @AppStorage("furniPrice") var furniPrice = 120
    @AppStorage("beatsPrice") var beatsPrice = 100
    @AppStorage("jackPrice") var jackPrice = 150
    @AppStorage("laurenePrice") var laurenePrice = 200
    @AppStorage("georgianPrice") var georgianPrice = 45
    // high or low
    @AppStorage("duskArrow") var duskArrow = true
    @AppStorage("musicArrow") var musicArrow = true
    @AppStorage("furniArrow") var furniArrow = true
    @AppStorage("beatsArrow") var beatsArrow = true
    @AppStorage("jackArrow") var jackArrow = true
    @AppStorage("laureneArrow") var laureneArrow = true
    @AppStorage("georgianArrow") var georgianArrow = true
    
    // average high
    @AppStorage("duskHigh") var duskHigh = 120
    @AppStorage("musicHigh") var musicHigh = 230
    @AppStorage("furniHigh") var furniHigh = 180
    @AppStorage("beatsHigh") var beatsHigh = 150
    @AppStorage("jackHigh") var jackHigh = 160
    @AppStorage("laureneHigh") var laureneHigh = 230
    @AppStorage("georgianHigh") var georgianHigh = 135
    @AppStorage("new2") var new2 = true
    // average low
    @AppStorage("duskLow") var duskLow = 28
    @AppStorage("musicLow") var musicLow = 40
    @AppStorage("furniLow") var furniLow = 60
    @AppStorage("beatsLow") var beatsLow = 50
    @AppStorage("jackLow") var jackLow = 75
    @AppStorage("laureneLow") var laureneLow = 100
    @AppStorage("georgianLow") var georgianLow = 35
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    @State var tooPoor = false
    @State var stocks = [
        
        Stockie(name: "Dusk Motors", price: 0, upOrDown: upOrDowns[0], marketCap: "5B", lowestToday: "8", highestToday: "10", num: 0),
        Stockie(name: "Music Max, Inc.", price: 0, upOrDown: upOrDowns[1], marketCap: "350M", lowestToday: "1", highestToday: "3", num: 1),
        Stockie(name: "FurniWear, Inc.", price: 0, upOrDown: upOrDowns[1], marketCap: "3.58B", lowestToday: "1", highestToday: "3", num: 2),
        Stockie(name: "Beats Entertainment LLC", price: 0, upOrDown: upOrDowns[1], marketCap: "20B", lowestToday: "1", highestToday: "3", num: 3),
        Stockie(name: "Jack's Beef", price: 0, upOrDown: upOrDowns[1], marketCap: "500M", lowestToday: "1", highestToday: "3", num: 4),
        
        Stockie(name: "Laurene & Co.", price: 0, upOrDown: upOrDowns[1], marketCap: "2.3B", lowestToday: "1", highestToday: "3", num: 5),
        
        Stockie(name: "Georgian Air", price: 0, upOrDown: upOrDowns[1], marketCap: "850M", lowestToday: "1", highestToday: "3", num: 6)
    ]
    
    
    
    var body: some View {
        NavigationView {
            
            
            List(stocks) { stock in
                
                Section {
                    
                    Button {
                        buyShares = true
                        companySelected = "\(stock.name)"
                        
                        if stock.name == "Dusk Motors" {
                            price = duskPrice
                        } else if stock.name == "Music Max, Inc." {
                            price = musicPrice
                        } else if stock.name == "FurniWear, Inc." {
                            price = furniPrice
                        } else if stock.name == "Beats Entertainment LLC" {
                            price = beatsPrice
                        } else if stock.name == "Jack's Beef" {
                            price = jackPrice
                        } else if stock.name == "Laurene & Co." {
                            price = laurenePrice
                        } else if stock.name == "Georgian Air" {
                            price = georgianPrice
                        }
                        
                        numie = stock.num
                    } label: {
                        StockRow(stock: stock)
                        if stock.num == 0 {
                            
                            HStack {
                                Spacer()
                                if duskArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(duskPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(duskHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(duskLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        } else if stock.num == 1 {
                            HStack {
                                Spacer()
                                if musicArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(musicPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(musicHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(musicLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        } else if stock.num == 2 {
                            HStack {
                                Spacer()
                                if furniArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(furniPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(furniHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(furniLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        } else if stock.num == 3 {
                            HStack {
                                Spacer()
                                if beatsArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(beatsPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(beatsHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(beatsLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }  else if stock.num == 4 {
                            HStack {
                                if jackArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(jackPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(jackHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(jackLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }  else if stock.num == 5 {
                            HStack {
                                Spacer()
                                if laureneArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(laurenePrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(laureneHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(laureneLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }  else if stock.num == 6 {
                            HStack {
                                if georgianArrow == true  {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .font(.title)
                                } else  {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                Text("$ \(georgianPrice)")
                                    .foregroundColor(.green)
                                    .font(.title2)
                            }
                            Spacer()
                            HStack {
                                Text("Average high: $ \(georgianHigh)")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                                    .fontWeight(.light)
                                Spacer()
                                Text("Average low: $ \(georgianLow)")
                                    .foregroundColor(.red)
                                    .font(.body)
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }
                        
                        
                    }
                    .sheet(isPresented: $buyShares) {
                        
                        NavigationView {
                            
                            List {
                                
                                if companySelected != "" {
                                    
                                    if companySelected == "Dusk Motors" {
                                        Text("Dusk Motors is a world renowned vehicle company that has made innovative contributions in the automobile industry. From motorcycles to electric cars, Dusk Motors is revolutionising transportation.\n\nThey are currently working on electric vehicles and more environmetally friendly solutions.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "Music Max, Inc." {
                                        Text("Music Max has revolutionised the way we listen to music. From great headphones to a plethora of streaming services, Music Max has made music available to millions.\n\nThey're currently investing in better headphone technology, and plan to better support artists for their creations on the platform.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "FurniWear, Inc." {
                                        Text("What started out as a humble winter clothing store has become the hit clothing brand of the century.\n\nWith outfits to match almost anyone's needs, FurniWear's working to make fashion more accessible, affordable, comfy and full of style.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "Beats Entertainment LLC" {
                                        Text("Beats Entertainment is a movie studio that has produced some of the biggest hits of the decade. They're innovating to bring movies closer to people.\n\nThey've recently launched their own movie streaming service, with their full movie library on the app.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "Jack's Beef" {
                                        Text("What started out as a humble butcher's business is now the leader in a plethora of meat products. From Beef Jerky, to Beef stew, to steak to hamburgers, they've got a lot of food.\n\nThey have over 500 restaurants across the country, with some of their meat products in all major retailers for you prepare their food at home.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "Laurene & Co." {
                                        Text("A company that specialises in jewelry and exclusive handbags as well as purses, Laurene & Co.'s mission is to make products of only the finest craftsmanship in the world.\n\nWith over 1000 stores across the world, they trade at higher share prices due to their reputation as a globally renowned luxury goods retailer.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                    } else if companySelected == "Georgian Air" {
                                        Text("Georgian Air is a low-cost long haul airline company that seeks to provide a great flying experience at low prices.\n\nThey have flights connecting all major cities, and have a strong frequent flyer loyalty programme.")
                                            .fontWeight(.ultraLight)
                                            .font(.callout)
                                        
                                    }
                                    
                                    Text("Think this is a good investment? Buy some shares and see what happens to your money! \n \nNote: Stock information in this app do not reflect real values!")
                                        .foregroundColor(.gray)
                                    
                                    HStack {
                                        Text("\(sharesBuying) shares")
                                        Stepper(value: $sharesBuying, in: 1...100000) {
                                            
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    Text("Cost: $\(price * sharesBuying)")
                                        .fontWeight(.bold)
                                    HStack {
                                        Spacer()
                                        Button("Purchase") {
                                            sureBuy = true
                                        }
                                        .foregroundColor(.blue)
                                        .alert("Are you sure?", isPresented: $sureBuy) {
                                            
                                            HStack {
                                                Button("Yes") {
                                                    
                                                    
                                                    if cash >= price*sharesBuying {
                                                        shares[numie] += sharesBuying
                                                        UserDefaults.standard.set(shares, forKey: "shares")
                                                        cash -= (price*sharesBuying)
                                                        buyShares = false
                                                        print(shares)
                                                    } else {
                                                        tooPoor = true
                                                    }
                                                    
                                                }
                                                
                                                Button("No") {
                                                    
                                                }
                                                
                                            }
                                        } message: {
                                            Text("Are you sure you wanna buy \(sharesBuying) share(s) of \(companySelected)?")
                                        }
                                        .alert("You don't have enough cash!", isPresented: $tooPoor) {
                                            
                                        } message: {
                                            Text("Try selling shares of other companies you own.")
                                        }
                                        Spacer()
                                    }
                                    
                                    
                                } else  if companySelected == "" {
                                    Text("This stock is still loading. Click another one.")
                                }
                            }
                            .navigationTitle("\(companySelected)")
                        }
                    }
                    
                    
                }  footer: {
                    HStack(alignment:.center){
                        Text("Click to purchase. Share prices change every 20s.")
                    }
                }
                
                
                
                
            }
            .navigationTitle("Stocks")
            .sheet(isPresented: $new2) {
                VStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Welcome to Stockoholic!")
                            .font(.largeTitle)
                            .fontWeight(.black)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Text("- This app is meant for both kids and adults to learn more about investing. \n \n - You can buy shares in 7 different companies from different industries with virtual currency. \n \n- Follow your intuition, and see if you're money grows. Buy items from the market to have a chance to increase your net worth. \n \n - Please not that share prices in this app do not reflect real share values! \n \nCan you become a billionaire investor?")
                                .fontWeight(.light)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            Text("Remember, buy low, sell high!")
                            Spacer()
                            Text("Tips:")
                                .font(.title)
                                .fontWeight(.black)
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Text(" 1. Diversify your portfolio \n 2. Do your research \n 3. Don’t listen to others advice without \n checking first \n 4. Don’t blindly invest in stocks \n because others tell you to \n 5. Don’t put all your eggs \n in one basket")
                                    .fontWeight(.light)
                                Spacer()
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
            }
            .onDisappear {
                new2 = false
            }
            
            
            
        }
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                
                timeRemaining -= 1
                
            } else {
                duskPrice = Int(round(Double(duskPrice) * Double.random(in: 0.95...1.05)))
                musicPrice = Int(round(Double(duskPrice) * Double.random(in: 0.925...1.075)))
                furniPrice = Int(round(Double(duskPrice) * Double.random(in: 0.975...1.025)))
                beatsPrice = Int(round(Double(duskPrice) * Double.random(in: 0.925...1.075)))
                jackPrice = Int(round(Double(duskPrice) * Double.random(in: 0.95...1.05)))
                laurenePrice = Int(round(Double(duskPrice) * Double.random(in: 0.9...1.1)))
                georgianPrice = Int(round(Double(duskPrice) * Double.random(in: 0.95...1.05)))
                
                if duskPrice > 165 {
                    duskArrow = true
                    duskHigh = Int.random(in: 170...250)
                    duskLow = Int.random(in: 120...164)
                } else {
                    duskArrow = false
                    duskHigh = Int.random(in: 130...220)
                    duskLow = Int.random(in: 50...90)
                }
                
                if musicPrice > 270 {
                    musicArrow = true
                    musicHigh = Int.random(in: 350...450)
                    musicLow = Int.random(in: 150...250)
                } else {
                    musicArrow = false
                    musicHigh = Int.random(in: 150...250)
                    musicLow = Int.random(in: 50...100)
                }
                
                if furniPrice > 120 {
                    furniArrow = true
                    furniHigh = Int.random(in: 150...220)
                    furniLow = Int.random(in: 60...110)
                } else {
                    furniArrow = false
                    furniHigh = Int.random(in: 100...170)
                    furniLow = Int.random(in: 60...80)
                }
                
                if beatsPrice > 270 {
                    beatsArrow = true
                    beatsHigh = Int.random(in: 350...450)
                    beatsLow = Int.random(in: 150...250)
                } else {
                    beatsArrow = false
                    beatsHigh = Int.random(in: 150...250)
                    beatsLow = Int.random(in: 80...120)
                }
                
                if jackPrice > 230 {
                    jackArrow = true
                    jackHigh = Int.random(in: 270...370)
                    jackLow = Int.random(in: 120...250)
                } else {
                    jackArrow = false
                    jackHigh = Int.random(in: 150...250)
                    jackLow = Int.random(in: 75...130)
                }
                
                if laurenePrice > 415 {
                    laureneArrow = true
                    laureneHigh = Int.random(in: 570...780)
                    laureneLow = Int.random(in: 270...370)
                } else {
                    laureneArrow = false
                    laureneHigh = Int.random(in: 370...570)
                    laureneLow = Int.random(in: 120...290)
                }
                
                if georgianPrice > 135 {
                    georgianArrow = true
                    georgianHigh = Int.random(in: 250...320)
                    georgianLow = Int.random(in: 80...170)
                } else {
                    georgianArrow = false
                    georgianHigh = Int.random(in: 150...250)
                    georgianLow = Int.random(in: 60...150)
                }
                
                
                
                timeRemaining = 20
                
                //Any other code that should happen after countdown
            }
        }
        
        
        
    }
}
struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
            .preferredColorScheme(.dark)
    }
}

