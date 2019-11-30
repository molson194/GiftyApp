//
//  SignupView.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct SignupView : View {
    @State var name: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView {
            Color(red: 211/255, green: 190/255, blue: 254/255)
                .edgesIgnoringSafeArea(.vertical) // Ignore just for the color
                .overlay(
                    
                    VStack {
                        
                        TextField("Name", text: $name).padding().background(Color.white).cornerRadius(4.0)
                        TextField("Phone Number", text: $phone).padding().background(Color.white).cornerRadius(4.0)
                        TextField("Password", text: $password).padding().background(Color.white).cornerRadius(4.0)
                        
                        NavigationLink(destination: VerifyPhoneView()) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Send Verification Code").foregroundColor(Color.black)
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(4.0)
                        
                    }.padding()
            )
        }
    }
    
}
