//
//  ProgressView.swift
//  test for front page
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI
struct SheetView6: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}


struct ProgressView: View {
    @State private var showingSheet6 = false
    var body: some View {
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Button {
                        showingSheet6.toggle()
                    } label: {
                        Image(systemName:  "text.book.closed")
                            .font(.title)
                    }
                    .sheet(isPresented: $showingSheet6) {
                        SheetView6()
                    }
                    .position(x: 27, y: 8)
                    
                }
                VStack {
                        ZStack {
                            
                            Circle()
                                .frame(width: 200, height: 200)
                            Image(systemName: "flame")
                                .foregroundColor(.black)
                                .font(.system(size: 100))
                                    .foregroundColor(.white)
                        }
                  
                            ZStack {
                                Color(red: 0.03111111111, green: 0.14666666666, blue: 0.20444444444)
                                    .edgesIgnoringSafeArea(.all)
                            HStack {
                                VStack {
                                    HStack {
                                        Text("Your Goals")
                                            .font(.largeTitle)
                                            .padding(20)
                                        Spacer()
                                    }
                                    Text("Hello world")
                                        .frame(width: 250, height: 0)
                                        .padding(50)
                                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                                    Text("Hello world")
                                        .frame(width: 250, height: 0)
                                        .padding(50)
                                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                                    Text("Hello world")
                                        .frame(width: 250, height: 0)
                                        .padding(50)
                                        .border(Color(red: 0.86222222222, green: 0.93777777777, blue: 0.91111111111), width: 5)
                                }
                        }
                        
                    }
            }
                .navigationTitle("Your Progress")
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .preferredColorScheme(.dark)
    }
}
