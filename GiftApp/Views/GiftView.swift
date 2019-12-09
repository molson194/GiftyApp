//
//  GiftView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct GiftView: View {
    let details = Text("Caption")
    @State var showDetails = false
    
    var body: some View {
        VStack {
           Image("card")
               .resizable()
               .aspectRatio(contentMode: .fit)

           HStack {
               VStack(alignment: .leading) {
                   Text("From: Matt Olson")
                       .font(.title)
                       .fontWeight(.black)
                       .foregroundColor(.primary)
                       .lineLimit(3)
                    Text("To: Nordstroms")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
               }
               Spacer()
           }
           .padding()
            
            // TODO: open the extra details when tapped
            if showDetails {
                //details.transition(.opacity)
                HStack {
                    Text("Caption")
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("$10.35")
                    Spacer()
                    Text("Expires 1/20")
                }
                .padding()
            }
       }
        .onTapGesture {
           withAnimation {
              self.showDetails.toggle()
           }
        }
       .cornerRadius(10)
       .overlay(
           RoundedRectangle(cornerRadius: 10)
               .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 1), lineWidth: 1)
       )
       .padding([.top, .horizontal])
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
