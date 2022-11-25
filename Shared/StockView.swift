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
    var stocksOwned:Int
    let num:Int
}

struct StockRow: View {
    @State var sharesOwned = []
    var stock: Stock
    @State private var shares: [Int] = UserDefaults.standard.object(forKey: "shares") as? [Int] ?? [0, 0, 0, 0, 0, 0, 0]
    
    var body: some View {
        Text("\(stock.name)")
            .font(.title2)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.medium)
    }
}
struct StockView: View {
    @AppStorage("new") var new = true
    @State var showStock = false
    @State var searchText = ""
    @AppStorage("cash") var cash = 1000
    
    @State var buyShares = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 0
    @AppStorage("new2") var new2 = true
    
    @State var currentStock: Int?
    
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
                        currentStock = stock.num
                        buyShares = true
                    } label: {
                        Spacer()
                        StockRow(stock: stock)
                        Spacer()
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
                            Text("$ \(stock.pricePerStockArray[0])")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                        Spacer()
                        HStack {
                            Text("Average high: $ \(stock.pricePerStockArray.max() ?? 0)")
                                .font(.body)
                                .foregroundColor(Color("Yellow"))
                                .fontWeight(.light)
                            Spacer()
                            Text("Average low: $ \(stock.pricePerStockArray.min() ?? 0)")
                                .foregroundColor(.red)
                                .font(.body)
                                .fontWeight(.light)
                        }
                        Spacer()
                        
                        
                    }
                    
                    
                }  footer: {
                    HStack{
                        Spacer()
                        Text("Click to purchase. Share price will change in \(timeRemaining)s.")
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $buyShares) {
                BuyAndSellView(stockNum: currentStock ?? -1)
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
                    while stockManager.stocks[i].pricePerStockArray.count > 11{
                        stockManager.stocks[i].pricePerStockArray.removeLast()
                    }
                }
                
                timeRemaining = 5
                
                //Any other code that should happen after countdown
            }
        }
    }
}
struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}

