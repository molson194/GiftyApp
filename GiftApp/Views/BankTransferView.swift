//
//  BankTransferView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct BankTransferView: View {
    @State private var selectedRow = 1
    
    var body: some View {
        VStack{
            HStack{
                Text("Transfer $25 to")
                Spacer()
            }
            .padding()
            
            List {
                ForEach(1...5, id: \.self) {i in
                    Button(action: {
                        self.selectedRow = i
                    }) {
                        HStack {
                            CardView()
                            Spacer()
                            if i == self.selectedRow{
                                Image("first")
                            }
                        }
                    }
                }
                NavigationLink(destination: AddCardView()) {
                    Text("Add new card...")
                }
            }
            .padding()
            
            Text("Transfer speeds vary and can take up to 3 business days to complete")
            
            Spacer()
            
            NavigationLink(destination: ProfileView()) {
                Button(action: {
                    // Initiate transfer api call
                }) {
                    Text("Transfer $25 to Bank")
                      .fontWeight(.bold)
                      .font(.headline)
                      .padding()
                      .background(Color.purple)
                      .cornerRadius(40)
                      .foregroundColor(.white)
                }
            }
            .padding()
            
        }
    }
}

struct BankTransferView_Previews: PreviewProvider {
    static var previews: some View {
        BankTransferView()
    }
}
