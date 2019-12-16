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
    @State private var expiration: String = ""
    @State private var comment: String = ""
    
    @State var showDetails = false
    var body: some View {
        VStack {
            TextField("To", text: $friend)
                .padding()
            TextField("Vendor", text: $vendor)
                .padding()
            
            HStack{
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                Spacer()
                TextField("Expiration", text: $expiration)
                    .keyboardType(.numberPad)
            }
            .padding()
            
            TextField("Comment", text: $comment)
                .padding()
                .lineLimit(3)
            
            if !showDetails {
                Button(action: {
                    self.showDetails.toggle()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Send Gift")
                            .fontWeight(.bold)
                            .font(.headline)
                            .padding()
                        Spacer()
                    }
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                })
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
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                }
            }

        }
        .padding()
        .navigationBarTitle(Text("Send"))
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
