//
//  LoginView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/28/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView {
            Color(red: 211/255, green: 190/255, blue: 254/255)
                .edgesIgnoringSafeArea(.vertical) // Ignore just for the color
                .overlay(
                    
                    VStack {
                        TextField("Phone Number", text: $email).padding().background(Color.white).cornerRadius(4.0)
                        TextField("Password", text: $password).padding().background(Color.white).cornerRadius(4.0)
                        
                        NavigationLink(destination: ContentView()) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Login").foregroundColor(Color.black)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
