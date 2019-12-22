//
//  GiftView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct GiftView: View {
    var gift: Gift
    
    var body: some View {
        
           
        VStack{
            
            // Location and Caption
            VStack{
                HStack {
                    Spacer()
                
                    VStack {
                        Text(gift.vendor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(8.0)
                        Text(gift.caption)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50.0)
                    }
            
                    Spacer()
                
                
                }
            }
            .padding(.vertical, 30)
            .background(Color(red: 240/255, green: 240/255, blue: 240/255, opacity: 1))

            // Person and amount remaining
            HStack {
                Spacer()
                HStack{
                    Text(gift.fromId)
                    Text("•")
                    Text("$" + gift.remainingBalance)
                }.padding()
                Spacer()
            }
            .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
        }.cornerRadius(20)
        .shadow(radius: 2, x: 0, y: 4)
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView(gift: Gift(fromId: "+13035147424", vendor: "Chipotle", caption: "Tacos", remainingBalance: "10.00"))
    }
}
