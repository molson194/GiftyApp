//
//  RootView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/10/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var loggedIn: Bool
    var body: some View {
        NavigationView {
            if loggedIn {
                ContentView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(loggedIn: true)
    }
}
