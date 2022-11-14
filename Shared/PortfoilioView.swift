//
//  PortfoiloView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct PortfoilioView: View {
    var body: some View {
            ZStack {
                Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Text("Portfoilo Value")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 300, height: 200)
                            .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                            .foregroundColor(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))

                        
                    }
                    VStack {
                        Text("Account Balance")
                            .padding()
                            .font(.largeTitle)
                        Text("$100000")
                            .padding()
                            .font(.title)
                            .foregroundColor(.green)
                        Text("Networth")
                            .padding()
                            .font(.largeTitle)
                        Text("$100000")
                            .padding()
                            .font(.title)
                            .foregroundColor(.green)
                    }
                    .foregroundColor(.white)
                    VStack {
                            Text("Asset Owned")
                            .font(.largeTitle)
                            .padding()
                        VStack {
                            Text("Apple Stock : 2")
                            Text("Mircosoft Stock : 5")
                            Text("Yahoo Stock : 4")
                        }
                        .frame(width: 300, height: 130)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                       
                        
                    }
                    Spacer()
                }
            }

            .navigationTitle("Your Portfoilo")
        }
    }
    
    struct PortfoiloView_Previews: PreviewProvider {
        static var previews: some View {
            PortfoilioView()
                .preferredColorScheme(.dark)
            
        }
    }

