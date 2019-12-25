//
//  BankTransferView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct BankTransferView: View {

    @State private var amount: String = ""
    @State private var payment: String = ""
    
    var body: some View {
        VStack{
            
            // Information Bar
            VStack {
            HStack {
                
             Image(systemName: "info.circle.fill")
               .resizable()
               .frame(width: 30.0, height: 30.0)
                
                
                Text("Transfer speeds vary and can take up to 10 business days to complete.")
                Spacer()
            }.padding()
            
            .background(Color.white)
            }
            .cornerRadius(20)
            .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
            
            
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
            .cornerRadius(20)
            .shadow(radius: 3, x: 0, y: 0)
            .padding(.top, 5.0)
            
            
            
            
            // Transfer Form
            VStack{
               VStack{
                   
                   // Image Chain
                   HStack{
                       Image(systemName: "dollarsign.circle")
                           .resizable()
                           .frame(width: 35.0, height: 35.0)
                           .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                   
                       if !amount.isEmpty {
                           Image(systemName: "arrow.right")
                               .resizable()
                               .frame(width: 20.0, height: 20.0)
                               .foregroundColor(Color.gray)
                               
                           Image(systemName: "bag")
                               .resizable()
                               .frame(width: 35.0, height: 35.0)
                               .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                       }
                   
                       
                   }
                   // First Row
                   VStack{
                       // Name
                       ZStack(alignment: .center) {
                           if amount.isEmpty {
                               Text("How much would you like to transfer?")
                                   .fontWeight(.bold)
                                   .foregroundColor(.gray)
                                   .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                           }
                           TextField(" ", text: $amount)
                               .font(.system(size: 30, weight: .bold))
                               .multilineTextAlignment(.center)
                           }
                       
                   }
                
                    // Second Row
                    if !amount.isEmpty {
                                         
                         // Divider
                         Rectangle()
                         .frame(height: 1.0)
                         .foregroundColor(Color.black)
                                         
                         VStack{
                             // Payment type
                             ZStack(alignment: .leading) {
                                if payment.isEmpty {
                                    HStack {
                                        
                                    Spacer()
                                    Text("Bank Account")
                                       .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18))
                                        .padding(.vertical, 5.0)
                                    Spacer()
                                    }
                                    
                                }
                             TextField(" ", text: $payment)
                                 .font(.system(size: 18, weight: .bold))
                                 .multilineTextAlignment(.center)
                                 .padding(.vertical, 5.0)
                                 
                             }
    
                          }
                     }
                
                    
                   

                   

                   
                   
               }
               .padding(22)
               .background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
           }.cornerRadius(20)
           .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
            
            // Button
                if !amount.isEmpty && !payment.isEmpty {
                    
                    NavigationLink(destination: ProfileView()) {
                        Button(action: {
                            // Initiate transfer api call
                            }) {
                            Text("transfer :)")
                              .fontWeight(.bold)
                              .font(.headline)
                              .padding()
                              .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                              .cornerRadius(20)
                              .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 4.0)
            }
            
            
            
            
            
            
            Spacer()
            
            
            
            
        }.padding()
    }
}

struct BankTransferView_Previews: PreviewProvider {
    static var previews: some View {
        BankTransferView()
    }
}
