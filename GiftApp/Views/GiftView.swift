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
    
    @State var showMessage = false
    var body: some View {
        
        VStack {
            
            // Header
            HStack{
                Image("mike")
                    .resizable()
                    .frame(width: 115, height: 115)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .padding(.leading,25)
                Text(gift.fromId + "\nsent you a gift!")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .padding(.leading, 3.0)
                Spacer()
            }.padding(.bottom, 5)
        
            //Card
            VStack{
                // Vendor + Icon / Caption
                VStack{
                    HStack(alignment: .center){
                        Text(gift.vendor)
                            .font(.title)
                            .fontWeight(.semibold)
                            .shadow(radius: 0.5)
                            .foregroundColor(Color(red: 125/255, green: 125/255, blue: 130/255, opacity: 1))
                        
                        Spacer()
                        
                        Image(systemName: "rectangle")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .shadow(radius: 0.5)
                            .foregroundColor(Color(red: 125/255, green: 125/255, blue: 130/255, opacity: 1))
                    }
                    
                    // Caption
                    HStack{
                        VStack{
                            Text(gift.caption)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .lineLimit(5)
                                .shadow(radius: 0.5)
                            .foregroundColor(Color(red: 125/255, green: 125/255, blue: 130/255, opacity: 1))
                            Spacer()
                        }.frame(minHeight: 100.0, maxHeight: 100.0)
                        Spacer()
                    }
                }
                    .padding(.top, 25.0)
                    .padding(.horizontal, 25.0)
                    .background(LinearGradient(gradient: Gradient(colors:
                        [Color(red: 250/255, green: 250/255, blue: 250/255, opacity: 1), .white]),
                    startPoint: .top,
                    endPoint: .bottom))
                    
                // Remaining Balance
                HStack{
                    if(showMessage){
                        Text("$" + gift.remainingBalance)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .shadow(radius: 0.5)
                        .padding(.vertical)
                        .padding(.leading, 25.0)
                    } else {
                        Toggle(isOn: $showMessage){
                            Text("Toggle to reveal amount.")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .shadow(radius: 0.5)
                                .padding(.vertical)
                                .padding(.leading, 25.0)
                        }
                    }
                    Spacer()
                }
                    .background(Color(red: 125/255, green: 125/255, blue: 130/255, opacity: 1))
            }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 2)
        }
            .padding(12)
            .padding(.top, 14)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 3)
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView(gift: Gift(id: 10, fromId: "+13035147424", vendor: "Chipotle", caption: "Hey man, I know you've been working really hard and are a little stressed out about getting the app done. This burrito is on me! 🥳", remainingBalance: "10.00"))
    }
}


//
