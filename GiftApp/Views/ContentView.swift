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
    
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 209/255, green: 166/255, blue: 255/255, alpha: 1)
        UINavigationBar.appearance().backgroundColor = UIColor(red: 209/255, green: 166/255, blue: 255/255, alpha: 1)
 
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        ZStack{

            Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1).edgesIgnoringSafeArea(.all)

        

        TabView(selection: $selection){
            
            // Promos
            NavigationView{
                PromosView()
            }
                .tabItem {
                    VStack {
                        Image("promos")
                        Text("Promos")
                    }
                }
                .tag(0)
            
            // Feed
            NavigationView{
                FeedView()
            }
                .tabItem {
                    VStack {
                        Image("feed")
                        Text("Feed")
                    }
                }
                .tag(1)
            
            // Send
            NavigationView{
               SendView()
                .navigationBarTitle(Text("Send"))
            }
                .tabItem {
                    VStack {
                        Image("send")
                        Text("Send")
                    }
                }
                .tag(2)
            
            // Basket
            NavigationView{
                BasketView()
                    .navigationBarItems(leading:
                    HStack {
                     Text("All your remaining gifts!")
                    })
                .navigationBarTitle(Text("Basket"))
            }
                .tabItem {
                    VStack {
                        Image("basket")
                        Text("Basket")
                    }
                }
                .tag(3)
            
            // Profile
            NavigationView {
               ProfileView()
            }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
