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

struct Stock: Identifiable, Codable{
    let id = UUID()
    
    let name:String
    //Change to Array<Double> if we use decimals like normal people
    //Will save as most recent as [0] and oldest as [10]
    var pricePerStockArray:Array<Int>
    let num:Int
}

struct StockRow: View {
    @State var sharesOwned = []
    var stock: Stock
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    
    var body: some View {
        Text("\(stock.name)")
            .font(.title2)
            .foregroundColor(.white)
            .fontWeight(.medium)
    }
}
struct StockView: View {
    @AppStorage("new") var new = true
    @State var showStock = false
    @State var searchText = ""
    @AppStorage("cash") var cash = 1000
    
    @State var buyShares = false
    @State var sureBuy = false
    @State var sharesBuying = 1
    @State var companySelected = ""
    @State var price = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 20
    @AppStorage("new2") var new2 = true
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    @State var tooPoor = false
    
    @StateObject var stockManager = StockManager()
    
    func UpdateStocks(){
        stockManager.stocks[0].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[0].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stockManager.stocks[1].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[1].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stockManager.stocks[2].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[2].pricePerStockArray[0]) * Double.random(in: 0.975...1.025)))),at:0)
        stockManager.stocks[3].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[3].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stockManager.stocks[4].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[4].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stockManager.stocks[5].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[5].pricePerStockArray[0]) * Double.random(in: 0.9...1.1)))),at:0)
        stockManager.stocks[6].pricePerStockArray.insert((Int(round(Double(stockManager.stocks[6].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
    }
    @State var show = false
    @State var sharesToSell = 1
    @State var sureSell = false
    @State var notEnoughShares = false
    @AppStorage("ferrariPrice") var ferrariPrice = 250000
    @AppStorage("lamPrice") var lamPrice = 350000
    @AppStorage("familyPrice") var familyPrice = 500000
    @AppStorage("condoPrice") var condoPrice = 1500000
    @AppStorage("bungalowPrice") var bungalowPrice = 10000000
    @State var sharesSold = false
    
    var body: some View {
        NavigationView {
            
            List(stockManager.stocks) { stock in
                
                Section {
                    
                    Button {
                        buyShares = true
                        companySelected = "\(stock.name)"
                    } label: {
                        StockRow(stock: stock)
                        HStack {
                            
                            if stock.pricePerStockArray.count < 2 || stock.pricePerStockArray[0] > stock.pricePerStockArray[1]{
                                Image(systemName: "arrow.up")
                                    .foregroundColor(.green)
                                    .font(.title)
                            } else  {
                                Image(systemName: "arrow.down")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("$ \(stock.pricePerStockArray[0])")
                                .foregroundColor(.green)
                                .font(.title2)
                            Spacer()
                        }
                        
                        
                        Spacer()
                        HStack {
                            Text("Average high: $ \(stock.pricePerStockArray.max() ?? 0)")
                                .font(.body)
                                .foregroundColor(.yellow)
                                .fontWeight(.light)
                            Spacer()
                            Text("Average low: $ \(stock.pricePerStockArray.min() ?? 0)")
                                .foregroundColor(.red)
                                .font(.body)
                                .fontWeight(.light)
                        }
                        
                        
                    }
                    .sheet(isPresented: $buyShares) {
                        NavigationView {
                            List {
                                
                                if companySelected != "" {
                                    if #available(iOS 16.0, *) {
                                        Chart{
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-90))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-90)))"),
                                                y: .value("Price", stock.pricePerStockArray[9])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[9] > stock.pricePerStockArray[10] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-80))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-80)))"),
                                                y: .value("Price", stock.pricePerStockArray[8])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[8] > stock.pricePerStockArray[9] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-70))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-70)))"),
                                                y: .value("Price", stock.pricePerStockArray[7])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[7] > stock.pricePerStockArray[8] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-60))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-60)))"),
                                                y: .value("Price", stock.pricePerStockArray[6])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[6] > stock.pricePerStockArray[7] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-50))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-50)))"),
                                                y: .value("Price", stock.pricePerStockArray[5])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[5] > stock.pricePerStockArray[6] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-40))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-40)))"),
                                                y: .value("Price", stock.pricePerStockArray[4])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[4] > stock.pricePerStockArray[5] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-30))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-30)))"),
                                                y: .value("Price", stock.pricePerStockArray[3])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[3] > stock.pricePerStockArray[4] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-20))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-20)))"),
                                                y: .value("Price", stock.pricePerStockArray[2])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[2] > stock.pricePerStockArray[3] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-10))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-10)))"),
                                                y: .value("Price", stock.pricePerStockArray[1])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[1] > stock.pricePerStockArray[2] ? Color.green : Color.red)
                                            
                                            BarMark(
                                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date())):\(Calendar.current.component(.second, from: Date()))"),
                                                y: .value("Price", stock.pricePerStockArray[0])
                                            )
                                            .foregroundStyle(stock.pricePerStockArray[0] > stock.pricePerStockArray[1] ? Color.green : Color.red)
                                        }
                                        .padding()
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                    
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
                                                    
                                                    
                                                    if cash >= price * sharesBuying {
                                                        shares[stock.num] += sharesBuying
                                                        UserDefaults.standard.set(shares, forKey: "shares")
                                                        cash -= (price * sharesBuying)
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
                                    
                                    
                                } else {
                                    Text("This stock is still loading. Click another one.")
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
                                        
                                        Text("\(stock.pricePerStockArray[0]*sharesToSell)")
                                        
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
                                                if shares[stock.num] >= sharesToSell {
                                                    cash += stock.pricePerStockArray[0]*sharesToSell
                                                    shares[stock.num] -= sharesToSell
                                                    UserDefaults.standard.set(shares, forKey: "shares")
                                                    sharesSold = true
                                                } else {
                                                    notEnoughShares = true
                                                }
                                            }
                                            
                                            Button("No")
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
                while stockManager.stocks[0].pricePerStockArray.count < 12 {
                    UpdateStocks()
                }
                
                for i in 0...5 {
                    if stockManager.stocks[i].pricePerStockArray.count > 11{
                        stockManager.stocks[i].pricePerStockArray.removeLast()
                    }
                }
                
                timeRemaining = 10
                
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

