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

struct Stock: Identifiable{
    let id = UUID()
    
    let name:String
    //Change to Array<Double> if we use decimals like normal people
    //Will save as most recent as [0] and oldest as [10]
    var pricePerStockArray:Array<Int>
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
    @State var numie = 0
    @State var sureBuy = false
    @State var sharesBuying = 1
    @State var companySelected = ""
    @State var price = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 20
    @AppStorage("new2") var new2 = true
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    @State var tooPoor = false
    @State var stocks = [
        Stock(name: "Dusk Motors", pricePerStockArray: [300]),
        Stock(name: "Music Max, Inc.", pricePerStockArray: [520]),
        Stock(name: "FurniWear, Inc.", pricePerStockArray: [220]),
        Stock(name: "Beats Entertainment LLC", pricePerStockArray: [500]),
        Stock(name: "Jack's Beef", pricePerStockArray: [450]),
        Stock(name: "Laurene & Co.", pricePerStockArray: [825]),
        Stock(name: "Georgian Air", pricePerStockArray: [343])
    ]
    
    func UpdateStocks(){
        stocks[0].pricePerStockArray.insert((Int(round(Double(stocks[0].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stocks[1].pricePerStockArray.insert((Int(round(Double(stocks[1].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stocks[2].pricePerStockArray.insert((Int(round(Double(stocks[2].pricePerStockArray[0]) * Double.random(in: 0.975...1.025)))),at:0)
        stocks[3].pricePerStockArray.insert((Int(round(Double(stocks[3].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stocks[4].pricePerStockArray.insert((Int(round(Double(stocks[4].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stocks[5].pricePerStockArray.insert((Int(round(Double(stocks[5].pricePerStockArray[0]) * Double.random(in: 0.9...1.1)))),at:0)
        stocks[6].pricePerStockArray.insert((Int(round(Double(stocks[6].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
    }
    
    var body: some View {
        NavigationView {
            
            
            List(stocks) { stock in
                
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
                    Text("Click to purchase shares. Share prices change every 20s.")
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
                UpdateStocks()
                
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

