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
            Text("Coming Soon")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Promos")
                    }
                }
                .tag(0)
            Text("Coming Soon")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Feed")
                    }
                }
                .tag(1)
            Text("Coming Soon")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Send")
                    }
                }
                .tag(2)
            Text("Coming Soon")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Basket")
                    }
                }
                .tag(3)
            Text("Coming Soon")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
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
