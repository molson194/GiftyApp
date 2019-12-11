//
//  WelcomeView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/28/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {

            //Background Color
            Color(red: 209/255, green: 166/255, blue: 255/255)
            .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                
                // Logo
                Spacer()
                Text("🎁💝")
                    .bold()
                    .font(.system(size: 100))
                Text("💝🥳")
                    .bold()
                    .font(.system(size: 100))
                Text("gifty")
                    .fontWeight(.semibold)
                    .bold()
                    .font(.system(size: 60))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 15.0)
               
                // Buttons
                HStack{

                    // Sign Up
                    NavigationLink(destination: SignupView()) {
                        Text("sign up!")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    }
                        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                        .cornerRadius(8)
                        .padding([.top, .leading, .bottom])
                    
                    // Log In
                    NavigationLink(destination: LoginView()) {
                        Text("I have an account :)")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.2))
                        .cornerRadius(8)
                        .padding([.top, .bottom, .trailing])
                        
                }
                
                Spacer()
                Spacer()
                                   
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
