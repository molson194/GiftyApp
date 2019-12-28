//
//  CardView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/28/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var bankName : String
    var accountName : String
    var accountMask : String
    
    var body: some View {
        VStack {
            HStack {
                Text(bankName)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Text(accountMask)
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
            }.background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                  
            // Balance
            HStack{
                
                Text(accountName)
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
                Spacer()
                Text("Delete")
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
            }.background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
        }
        .cornerRadius(20)
        .shadow(radius: 3, x: 0, y: 0)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(bankName: "Chase", accountName: "Checking", accountMask: "0000")
    }
}
