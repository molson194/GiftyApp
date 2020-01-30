//
//  WelcomeView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/28/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var globalVariables : GlobalVariables
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        appearance.shadowColor = UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0)
         
        appearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0),
        ]
        
        appearance.backgroundColor = UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0)
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        
        let appearance2 = UINavigationBarAppearance()
        appearance2.shadowColor = UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0)
        appearance2.backgroundColor = UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0)
        appearance2.titleTextAttributes = [
            .foregroundColor : UIColor(red:0.82, green:0.65, blue:1.00, alpha:1.0),
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance2
        
    }
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {

                //Background Color
                Color(red: 209/255, green: 166/255, blue: 255/255)
                .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    
                    Spacer()
                    // Logo
                    
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
                        NavigationLink(destination: SignupView().environmentObject(globalVariables)) {
                            Text("sign up!")
                                .font(.headline)
                                .padding()
                                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                            .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                            .cornerRadius(8)
                            .padding([.top, .leading, .bottom])
                            .shadow(radius: 2, x: 0, y: 2)
                        
                        // Log In
                        NavigationLink(destination: LoginView().environmentObject(globalVariables)) {
                            Text("I have an account :)")
                                .font(.headline)
                                .padding()
                                .foregroundColor(Color.white)
                        }
                            .background(Color(red: 1, green: 1, blue: 1, opacity: 0.35))
                            .cornerRadius(8)
                            .padding([.top, .bottom, .trailing])
                            .shadow(radius: 1, x: 0, y: 2)
                            
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
                
            }
                .navigationBarTitle(Text("Home"))
        }
            .accentColor(.white)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(GlobalVariables())
    }
}
