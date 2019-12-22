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
            Image("profile")
                .resizable()
                .frame(width: 150.0, height: 150.0)
            
            Text("Matthew Olson")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding()
            
            Text("Balance: $25")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding()
            
            HStack{
                NavigationLink(destination: BankTransferView()) {
                    Text("Transfer to Bank")
                      .fontWeight(.bold)
                      .font(.headline)
                      .padding()
                      .background(Color.purple)
                      .cornerRadius(40)
                      .foregroundColor(.white)
                }
                
                NavigationLink(destination: CardsView()) {
                    Text("Add/Edit Cards")
                      .fontWeight(.bold)
                      .font(.headline)
                      .padding()
                      .background(Color.purple)
                      .cornerRadius(40)
                      .foregroundColor(.white)
                }
                
                Button(action: {
                    print("Action goes here")
                }, label: {
                    Text("Edit Account")
                      .fontWeight(.bold)
                      .font(.headline)
                      .padding()
                      .background(Color.purple)
                      .cornerRadius(40)
                      .foregroundColor(.white)
                })
            }
            .padding(.top, 20)
            
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
