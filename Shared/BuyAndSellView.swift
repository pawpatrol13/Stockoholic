//
//  BuyAndSellView.swift
//  Stockoholic (iOS)
//
//  Created by T Krobot on 25/11/22.
//

import SwiftUI
import Charts

struct BuyAndSellView: View {
    @StateObject var stockManager = StockManager()
    
    @AppStorage("cash") var cash = 1000
    @State var stockNum:Int
    @State var sharesBuying = 1
    @State var sharesToSell = 1
    
    @State var sureBuy = false
    @State var tooPoor = false
    @State var notEnoughShares = false
    @State var sureSell = false
    @State var sharesSold = false
    
    var body: some View {
        if stockNum == -1{
            Text("Stock is still loading, click another one!")
                .font(.title)
                .multilineTextAlignment(.center)
        } else {
            NavigationView{
                List {
                    if #available(iOS 16.0, *) {
                        Chart{
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-90))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-90)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[9])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[9] > stockManager.stocks[stockNum].pricePerStockArray[10] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-80))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-80)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[8])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[8] > stockManager.stocks[stockNum].pricePerStockArray[9] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-70))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-70)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[7])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[7] > stockManager.stocks[stockNum].pricePerStockArray[8] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-60))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-60)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[6])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[6] > stockManager.stocks[stockNum].pricePerStockArray[7] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-50))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-50)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[5])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[5] > stockManager.stocks[stockNum].pricePerStockArray[6] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-40))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-40)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[4])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[4] > stockManager.stocks[stockNum].pricePerStockArray[5] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-30))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-30)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[3])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[3] > stockManager.stocks[stockNum].pricePerStockArray[4] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-20))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-20)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[2])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[2] > stockManager.stocks[stockNum].pricePerStockArray[3] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date().addingTimeInterval(-10))):\(Calendar.current.component(.second, from: Date().addingTimeInterval(-10)))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[1])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[1] > stockManager.stocks[stockNum].pricePerStockArray[2] ? Color.green : Color.red)
                            
                            BarMark(
                                x: .value("Time", "\(Calendar.current.component(.minute, from: Date())):\(Calendar.current.component(.second, from: Date()))"),
                                y: .value("Price", stockManager.stocks[stockNum].pricePerStockArray[0])
                            )
                            .foregroundStyle(stockManager.stocks[stockNum].pricePerStockArray[0] > stockManager.stocks[stockNum].pricePerStockArray[1] ? Color.green : Color.red)
                        }
                        .chartYScale(domain: ((stockManager.stocks[stockNum].pricePerStockArray.min() ?? 0))...((stockManager.stocks[stockNum].pricePerStockArray.max() ?? 0)))
                        .chartXAxis(Visibility.hidden)
                        .padding()
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    if stockManager.stocks[stockNum].name == "Dusk Motors" {
                        Text("Dusk Motors is a world renowned vehicle company that has made innovative contributions in the automobile industry. From motorcycles to electric cars, Dusk Motors is revolutionising transportation.\n\nThey are currently working on electric vehicles and more environmetally friendly solutions.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "Music Max, Inc." {
                        Text("Music Max has revolutionised the way we listen to music. From great headphones to a plethora of streaming services, Music Max has made music available to millions.\n\nThey're currently investing in better headphone technology, and plan to better support artists for their creations on the platform.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "FurniWear, Inc." {
                        Text("What started out as a humble winter clothing store has become the hit clothing brand of the century.\n\nWith outfits to match almost anyone's needs, FurniWear's working to make fashion more accessible, affordable, comfy and full of style.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "Beats Entertainment LLC" {
                        Text("Beats Entertainment is a movie studio that has produced some of the biggest hits of the decade. They're innovating to bring movies closer to people.\n\nThey've recently launched their own movie streaming service, with their full movie library on the app.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "Jack's Beef" {
                        Text("What started out as a humble butcher's business is now the leader in a plethora of meat products. From Beef Jerky, to Beef stew, to steak to hamburgers, they've got a lot of food.\n\nThey have over 500 restaurants across the country, with some of their meat products in all major retailers for you prepare their food at home.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "Laurene & Co." {
                        Text("A company that specialises in jewelry and exclusive handbags as well as purses, Laurene & Co.'s mission is to make products of only the finest craftsmanship in the world.\n\nWith over 1000 stores across the world, they trade at higher share prices due to their reputation as a globally renowned luxury goods retailer.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                    } else if stockManager.stocks[stockNum].name == "Georgian Air" {
                        Text("Georgian Air is a low-cost long haul airline company that seeks to provide a great flying experience at low prices.\n\nThey have flights connecting all major cities, and have a strong frequent flyer loyalty programme.")
                            .fontWeight(.ultraLight)
                            .font(.callout)
                        
                    }
                    
                    Text("Think this is a good investment? Buy some shares and see what happens to your money! \n \nNote: Stock information in this app do not reflect real values!")
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("\(sharesBuying) shares")
                        Stepper(value: $sharesBuying, in: 1...100000){}
                    }
                    
                    Text("Cost: $\(stockManager.stocks[stockNum].pricePerStockArray[0] * sharesBuying)")
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
                                    
                                    
                                    if cash >= stockManager.stocks[stockNum].pricePerStockArray[0] * sharesBuying {
                                        stockManager.stocks[stockNum].stocksOwned += sharesBuying
                                        cash -= (stockManager.stocks[stockNum].pricePerStockArray[0] * sharesBuying)
                                    } else {
                                        tooPoor = true
                                    }
                                    
                                }
                                
                                Button("No") {
                                    
                                }
                            }
                        } message: {
                            Text("Are you sure you wanna buy \(sharesBuying) share(s) of \(stockManager.stocks[stockNum].name)?")
                        }
                        .alert("You don't have enough cash!", isPresented: $tooPoor) {
                            
                        } message: {
                            Text("Try selling shares of other companies you own.")
                        }
                        Spacer()
                    }
                    
                    Section {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Sell a Stock")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                            
                            Text("Price: $\(stockManager.stocks[stockNum].pricePerStockArray[0]*sharesToSell)")
                            
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
                                    if stockManager.stocks[stockNum].stocksOwned >= sharesToSell {
                                        cash += stockManager.stocks[stockNum].pricePerStockArray[0]*sharesToSell
                                        stockManager.stocks[stockNum].stocksOwned -= sharesToSell
                                        sharesSold = true
                                    } else {
                                        notEnoughShares = true
                                    }
                                }
                                
                                Button("No"){}
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
                .navigationTitle("\(stockManager.stocks[stockNum].name)")
            }
        }
    }
}

struct BuyAndSellView_Previews: PreviewProvider {
    static var previews: some View {
        BuyAndSellView(stockNum: 0)
    }
}
