//
//  CardsView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            
            // Information Bar
            VStack {
            HStack {
                
             Image(systemName: "info.circle.fill")
               .resizable()
               .frame(width: 30.0, height: 30.0)
                
                
                Text("Banks and credit cards can be used to validate purchases. Cards have more processing fees.")
                Spacer()
            }.padding()
            
            .background(Color.white)
            }
            .cornerRadius(20)
            .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
            .padding(.bottom)
            
            // Main Card
            VStack {
                
                // Profile Image and Name
                
                    HStack {
                        
                        
                        Text("Chase")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                   
                }.background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                      
                // Balance
                HStack{
                    
                    Text("Bank Account")
                        .font(.headline)
                        .fontWeight(.light)
                        .padding()
                    Spacer()
                    Text("Delete")
                    .font(.headline)
                        .fontWeight(.light)
                    .padding()
                }
                .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
            }
            .cornerRadius(20)
            .shadow(radius: 3, x: 0, y: 0)
            Spacer()
        }
    .padding()
        .navigationBarItems(trailing:
            NavigationLink(destination: AddCardView()) {
                Text("Add Account")
            }
        )
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
