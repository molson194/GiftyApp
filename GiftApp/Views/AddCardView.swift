//
//  AddCardView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/9/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct AddCardView: View {
    @EnvironmentObject var globalVariables : GlobalVariables
    var body: some View {
        VStack{
        AddAccountViewController().environmentObject(globalVariables)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView().environmentObject(GlobalVariables())
    }
}
