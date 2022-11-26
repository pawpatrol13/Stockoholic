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
    var stock: Stock
    
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
    @AppStorage("new2") var new2 = false
    
    @State var currentStock: Int?
    
    @EnvironmentObject var stockManager: StockManager
    
    func UpdateStocks(){
        stockManager.stocks[0].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[0].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stockManager.stocks[1].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[1].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stockManager.stocks[2].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[2].pricePerStockArray[0]) * Double.random(in: 0.975...1.025)))),at:0)
        stockManager.stocks[3].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[3].pricePerStockArray[0]) * Double.random(in: 0.925...1.075)))),at:0)
        stockManager.stocks[4].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[4].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stockManager.stocks[5].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[5].pricePerStockArray[0]) * Double.random(in: 0.9...1.1)))),at:0)
        stockManager.stocks[6].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[6].pricePerStockArray[0]) * Double.random(in: 0.95...1.05)))),at:0)
        stockManager.stocks[7].pricePerStockArray.insert((Int(ceil(Double(stockManager.stocks[7].pricePerStockArray[0]) * Double.random(in: 0.958...1.042)))),at:0)
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
                                Image(systemName: "arrowtriangle.up.fill")
                                    .foregroundColor(.green)
                                    .font(.title)
                            } else  {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                            Text("$ \(stock.pricePerStockArray[0])")
                                .foregroundColor(stock.pricePerStockArray.count < 2 || stock.pricePerStockArray[0] > stock.pricePerStockArray[1] ? .green : .red)
                                .font(.title2)
                        }
                        Spacer()
                        HStack {
                            Text("Average high: $ \(stock.pricePerStockArray.max() ?? 0)")
                                .foregroundColor(Color("Yellow"))
                                .font(.body)
                                .fontWeight(.light)
                            Spacer()
                            Text("Average low: $ \(stock.pricePerStockArray.min() ?? 0)")
                                .foregroundColor(Color("Yellow"))
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
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        new2 = true
                    } label: {
                        Image(systemName: "text.book.closed.fill")
                    }
                }
            }
            .sheet(isPresented: $new2) {
                ScrollView{
                    VStack {
                        
                        HStack {
                            Spacer()
                            Text("Welcome to Stockoholic!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        Text("Trading Made Fun")
                            .italic()
                            .padding(.bottom)
                        
                        VStack {
                            
                            Text("Buy shares in 8 different companies with virtual currency and items to boost your net worth.")
                                .fontWeight(.light)
                                .font(.body)
                                .padding()
                                .padding(.bottom)
                                .multilineTextAlignment(.center)
                            
                            
                            Text("Tips:")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom)
                        }
                        Text("One method to predict stocks is Technical analysis. Technical analysis is the imbalance between the supply and demand of stocks which predict the trend of stock prices. In order to implement this Method you have to: \n\n1. Identifying the trend is it upwards or downwards or sideways trend? \nEach of these three price trends requires a different trading approach, depending on your trading strategy \n\n2. Drawing support and resistance level. \nWhat is a support level and a resistance level? A support level is a level where the downward price trend of an asset pauses as buying demand increases, so the trend reverses and turns upward A resistance levels where the upward price momentum of the asset weakens and the price is likely to reverse and head downward Support and resistance levels can provide excellent opportunities for traders to open new trades \n\n3. Establishing entry and exit point. \nidentifying areas of support and resistance can present excellent entry positions same with technical indicators such as the Average True Range (ATR) and Relative Strength Index (RSI) These can help a trader establish whether there’s adequate momentum behind a price move. \n\n4. Position sizing and risk management. \nTechnical momentum and volatility indicators such as the Average True Range are commonly used by professional traders to help with Position sizing and risk management. Depending on your chosen risk/reward ratio, you can use the ATR to determine where to place your stop loss once you’ve identified an entry position. \n\nAnother method is Graph patterns. Graphs patterns is what you think it is, patterns within graphs. There a multiple types of these patterns, such as: \n\n1. Reversal pattern. \nReversal pattern is a price pattern that signals a change in the prevailing trend is known as a reversal pattern. These patterns signify periods where the bulls or the bears have run out of steam. The established trend will pause, then head in a new direction as new energy emerges from the other side. (bull or bear) \n\n2. Continuation pattern. \nContinuation pattern is a continuation pattern can be considered a pause during a prevailing trend. This is when the bulls catch their breath during an uptrend or when the bears relax for a moment during a downtrend. While a price pattern is forming, there is no way to tell if the trend will continue or reverse. ")
                            .fontWeight(.light)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        Text("Are you ready? Start trading now!")
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button{
                            new2 = false
                        } label: {
                                Text("Start trading")
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                        }
                        
                    }
                }
            }
            .onDisappear {
                new2 = false
            }
        }
        .environmentObject(stockManager)
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                
                timeRemaining -= 1
                
            } else {
                while stockManager.stocks[0].pricePerStockArray.count < 17 {
                    UpdateStocks()
                }
                
                for i in 0...5 {
                    while stockManager.stocks[i].pricePerStockArray.count > 16{
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

