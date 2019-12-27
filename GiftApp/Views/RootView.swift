//
//  RootView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/10/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var globalVariables : GlobalVariables
    var body: some View {
        ZStack{
            if globalVariables.loggedIn {
                ContentView().environmentObject(globalVariables)
            } else {
                WelcomeView().environmentObject(globalVariables)
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(GlobalVariables())
    }
}
