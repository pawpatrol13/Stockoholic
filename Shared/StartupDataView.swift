//
//  StartupDataView.swift
//  Stockoholic
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct StartupDataView: View {
    init() {
        UITableView.appearance().backgroundColor = .white

       }
       
    @State private var startUpAmount = 0.0
    var body: some View {
        ZStack {
            Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                .edgesIgnoringSafeArea(.all)
            VStack   {
                Text("Tesla Coils")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                        .foregroundColor(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                    Image(systemName: "chart.xyaxis.line")
                        .font(.system(size: 180))
                }
                VStack {
                    Text("Tesla Coils")
                        .font(.largeTitle)
                        .font(Font.body.bold())
                    VStack {
                        Text("Price paying :")
                            .font(Font.body.bold())
                        VStack {
                            Form {
                                Section {
                                    TextField("Amount", value: $startUpAmount, format: .currency(code: Locale.current.currencyCode ?? "SGD"))
                                        .keyboardType(.decimalPad)
                                        .frame(width: 350, height: 60)
                                        .foregroundColor(.white)
                                        .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                                        .edgesIgnoringSafeArea(.all)
                                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                                        .cornerRadius(10)
                                }
                            }
                            .frame(width: 350, height: 60)
                            .foregroundColor(.white)
                            .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                            .cornerRadius(10)
                           

                            VStack {
                                Text("Quanity :")
                                    .font(Font.body.bold())
                            }
                            Form {
                                Section {
                                    TextField("Amount", value: $startUpAmount, format: .currency(code: Locale.current.currencyCode ?? "SGD"))
                                        .keyboardType(.decimalPad)
                                }
                            }
                            .frame(width: 350, height: 60)
                            .foregroundColor(.white)
                            .background(Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444))
                            .cornerRadius(10)
                        }
                        VStack {
                            HStack {
                                Button {
                                    print("buy")
                                }label: {
                                    Text("Invest")
                                        .frame(width: 100, height: 30)
                                        .padding()
                                        .background(.green)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct StartupDataView_Previews: PreviewProvider {
    static var previews: some View {
        StartupDataView()
            .preferredColorScheme(.dark)
    }
}
