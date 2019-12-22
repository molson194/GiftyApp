//
//  ProfileView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            
            // Main Card
            VStack {
                
                // Profile Image and Name
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "rectangle.stack.person.crop")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                        .padding()
                        
                        Text("Matthew Olson")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                            .padding(.bottom)
                    }
                    Spacer()
                }.background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                      
                // Balance
                HStack{
                    Spacer()
                    Text("Balance: $25")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
            }
            .cornerRadius(20)
            .shadow(radius: 3, x: 0, y: 0)
            
            
            // Buttons
            VStack{
                
                // Transfer to Bank Account
                HStack{
                    Spacer()
                    NavigationLink(destination: BankTransferView()) {
                        Text("transfer balance to bank")
                            .fontWeight(.heavy)
                            .font(.headline)
                          .padding()
                          .foregroundColor(.white)
                    }
                    Spacer()
                }.background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1))
                .cornerRadius(20)
                    .padding(.all)
                
                // Add and Edit Cards Link
                HStack {
                    Spacer()
                    NavigationLink(destination: CardsView()) {
                        Text("add and edit cards")
                          .fontWeight(.bold)
                          .font(.headline)
                          .padding()
                          .foregroundColor(.white)
                    }
                    Spacer()
                }
                .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1))
                .cornerRadius(20)
                    .padding([.leading, .bottom, .trailing])
            }
            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
