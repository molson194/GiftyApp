//
//  ContentView.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        
        TabView(selection: $selection){
            
            // Promos
            PromosView()
                .tabItem {
                    VStack {
                        Image("promos")
                        Text("Promos")
                    }
                }
                .tag(0)
            
            // Feed
            FeedView()
                .tabItem {
                    VStack {
                        Image("feed")
                        Text("Feed")
                    }
                }
                .tag(1)
            
            // Send
            SendView()
                .tabItem {
                    VStack {
                        Image("send")
                        Text("Send")
                    }
                }
                .tag(2)
            
            // Basket
            BasketView()
                .tabItem {
                    VStack {
                        Image("basket")
                        Text("Basket")
                    }
                }
                .tag(3)
            
            // Profile
            ProfileView()
                .tabItem {
                    VStack {
                        Image("profile")
                        Text("Profile")
                    }
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
