//
//  GiftView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct GiftView: View {
    
    var body: some View {
        
           
        VStack{
            
            // Location and Caption
            VStack{
                HStack {
                    Spacer()
                
                    VStack {
                        Text("Starbucks")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(8.0)
                        Text("Treat yourself to some really nice coffee, you deserve it man. Hope to see you soon!")
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
                    Text("Matthew Olson")
                    Text("•")
                    Text("$23.09")
                }.padding()
                Spacer()
            }
            .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
        }.cornerRadius(20)
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
