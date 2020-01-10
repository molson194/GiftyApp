//
//  ContentView.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalVariables : GlobalVariables
    @State private var selection = 0
    
    
    var body: some View {
        
        ZStack{

            Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1).edgesIgnoringSafeArea(.all)

        

        TabView(selection: $selection){
            
            // Promos
            NavigationView{
                PromosView()
                .navigationBarTitle(Text("Promos"),displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        NavigationLink(destination: ThankYouView().environmentObject(globalVariables)) {
                            Image(systemName: "envelope.open")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FAQsView().environmentObject(globalVariables)) {
                            Image(systemName: "questionmark.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                )
            }.accentColor(.black)
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
                .navigationBarTitle(Text("Feed"),displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        NavigationLink(destination: ThankYouView().environmentObject(globalVariables)) {
                            Image(systemName: "envelope.open")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FAQsView().environmentObject(globalVariables)) {
                            Image(systemName: "questionmark.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }
                )
            }.accentColor(.black)
                .tabItem {
                    VStack {
                        Image("feed")
                        Text("Feed")
                    }
                }
                .tag(1)
            
            // Send
            NavigationView{
               SendView().environmentObject(globalVariables)
               .navigationBarTitle(Text("Send"),displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        NavigationLink(destination: ThankYouView().environmentObject(globalVariables)) {
                            Image(systemName: "envelope.open")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FAQsView().environmentObject(globalVariables)) {
                            Image(systemName: "questionmark.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }
                )
            }.accentColor(.black)
                .tabItem {
                    VStack {
                        Image("send")
                        Text("Send")
                    }
                }
                .tag(2)
            
            // Basket
            NavigationView{
                BasketView().environmentObject(globalVariables)
                .navigationBarTitle(Text("Basket"),displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        NavigationLink(destination: ThankYouView().environmentObject(globalVariables)) {
                            Image(systemName: "envelope.open")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FAQsView().environmentObject(globalVariables)) {
                            Image(systemName: "questionmark.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }
                )
            }.accentColor(.black)
                .tabItem {
                    VStack {
                        Image("basket")
                        Text("Basket")
                    }
                }
                .tag(3)
            
            // Profile
            NavigationView {
               ProfileView().environmentObject(globalVariables)
                .navigationBarTitle(Text("Profile"),displayMode: .inline)
                .navigationBarItems(leading:
                    HStack {
                        NavigationLink(destination: ThankYouView().environmentObject(globalVariables)) {
                            Image(systemName: "envelope.open")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }, trailing:
                    HStack {
                        NavigationLink(destination: FAQsView().environmentObject(globalVariables)) {
                            Image(systemName: "questionmark.circle")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                    }
                )
            }.accentColor(.black)
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
        ContentView().environmentObject(GlobalVariables())
    }
}
