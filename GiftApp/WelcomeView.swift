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
        NavigationView {
            VStack {
                Image("Gift")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 150.0, height: 150.0)
                .padding(Edge.Set.bottom, 20)
                
                Text("Welcome to Gifty").bold().font(.title)
                
                Text("Send and recieve gifts with all your friends")
                .font(.subheadline)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 70, trailing: 0))
                
                NavigationLink(destination: SignupView()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Sign up").foregroundColor(Color.black)
                        Spacer()
                    }
                                    
                }
                .padding()
                .background(Color(red: 211/255, green: 190/255, blue: 254/255))
                .cornerRadius(6.0)
                
                Spacer().frame(width: 0, height: 10, alignment: .center)
                
                NavigationLink(destination: LoginView()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Login").foregroundColor(Color.black)
                        Spacer()
                    }
                                    
                }
                .padding()
                .border(Color(red: 211/255, green: 190/255, blue: 254/255), width: 3)
                .cornerRadius(6.0)
                                      
            }.padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
