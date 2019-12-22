//
//  RootView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/10/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userStatus : UserStatus
    var body: some View {
        ZStack{
            if userStatus.loggedIn {
                ContentView()  
            } else {
                WelcomeView().environmentObject(userStatus)
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserStatus())
    }
}
