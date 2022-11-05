//
//  ContentView.swift
//  Shared
//
//  Created by Nethan on 30/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        NavigationLink (destination: StockView()) {
                            VStack{
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                Text("Stocks")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111))
                            .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                            
                            .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            .cornerRadius(10)
                        }
                        NavigationLink (destination: StartupView()) {
                            VStack {
                                Image(systemName: "person.3.sequence.fill")
                                Text("Start-ups")
                            }
                            .frame(width: 100, height: 80)
                            .padding(40)
                            .font(.title3)
                            .foregroundColor(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111))
                            .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                            
                            .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            .cornerRadius(10)
                        }
                    }
                        HStack {
                            NavigationLink (destination: PortfoilioView()) {
                                VStack {
                                    Image(systemName: "dollarsign.arrow.circlepath")
                                    Text("Portfolio")
                                }
                                .frame(width: 100, height: 80)
                                .padding(40)
                                .font(.title3)
                                .foregroundColor(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111))
                                .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                                .cornerRadius(10)
                            }
                            NavigationLink (destination: ProgressView()) {
                                VStack{
                                    Image(systemName: "flame")
                                    Text("Your Progess")
                                }
                                .frame(width: 100, height: 80)
                                .padding(40)
                                .font(.title3)
                                .foregroundColor(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111))
                                .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                                
                                .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                                .cornerRadius(10)
                            }
                        }
                }
               
            
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

