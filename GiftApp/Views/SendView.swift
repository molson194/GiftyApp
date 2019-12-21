//
//  SendView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct SendView: View {
    @State private var friend: String = ""
    @State private var vendor: String = ""
    @State private var amount: String = ""
    @State private var comment: String = ""
    @State private var payment: String = ""
    
    @State var showDetails = false
    var body: some View {
        
        VStack {
            
            // Page Title
            VStack{
                Text("let's get gifty 🥳")
                    .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .padding(.bottom, 10.0)
            }
            
            
            
           Image("bow")
            
            
            VStack{
            
            
            // First Row
            HStack{
                // Name
                TextField("your friend's name", text: $friend)
                    .padding(.vertical, 5.0)
                
                // Amount
                TextField("$0.00 ", text: $amount)
                    .padding(.vertical, 5.0)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                
            }
            
            // Second Row
            VStack{
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))

                //Location
                TextField("location (starbucks, apple, etc.)", text: $vendor)
                    .padding(.vertical, 5.0)
                
            }
            
            // Third Row
            VStack{
                
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                
                // Comment
                TextField("write something sweet! (ex: coffee on me!)", text: $comment)
                    .padding(.bottom, 200.0)
                
                
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
             }
            
            // Fourth Row
            VStack{
                
                // Comment
                TextField("payment type", text: $payment)
                    .padding(.vertical, 5.0)
                
                
                
             }
            }.padding(25)
            
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0), lineWidth: 15)
            )
                .background(Color(red: 254/255, green: 252/255, blue: 255/255, opacity: 1.0))
                .cornerRadius(30)
                .shadow(radius: 2, x: 0, y: 4)
            
            // Button
            if !showDetails {
                Button(action: {
                    self.showDetails.toggle()
                }, label: {
                    HStack {
                        
                        Text("send your gift :)")
                            .fontWeight(.bold)
                            .font(.headline)
                            .padding()
                    }
                    .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                }).padding(.top)
            }

            if showDetails {
                CardView()
                
                NavigationLink(destination: ContentView()) {
                    HStack {
                        Spacer()
                        Text("Send " + vendor + " to " + friend)
                            .fontWeight(.bold)
                            .font(.headline)
                            .padding()
                        Spacer()
                    }
                    .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .cornerRadius(CGFloat(40))
                    .foregroundColor(.white)
            }
        }
        }.padding()

}

}
struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
