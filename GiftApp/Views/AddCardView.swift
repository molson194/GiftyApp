//
//  AddCardView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/9/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct AddCardView: View {
    @State private var number: String = ""
    @State private var expiration: String = ""
    @State private var securityCode: String = ""
    @State private var zipCode: String = ""
    
    
    var body: some View {
        VStack {
            TextField("Card Number", text: $number)
                .keyboardType(.numberPad)
                .padding()
            
            HStack {
                TextField("Expiration", text: $expiration).keyboardType(.numberPad)
                Spacer()
                TextField("Security Code", text: $expiration).keyboardType(.numberPad)
            }
            .padding()
            
            TextField("Zip Code", text: $expiration)
                .keyboardType(.numberPad)
                .padding()
            
            HStack {
                Spacer()
                NavigationLink(destination: CardsView()) {
                        Text("Add Card")
                          .fontWeight(.bold)
                          .font(.headline)
                          .padding()
                }
                Spacer()
            }
            .background(Color.purple)
            .cornerRadius(40)
            .foregroundColor(.white)
            
            Spacer()
            
        }
        .padding()
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView()
    }
}
