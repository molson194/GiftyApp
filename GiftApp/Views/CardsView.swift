//
//  CardsView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var globalVariables : GlobalVariables
    
    var body: some View {
        VStack {
            HStack {
            
                Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 30.0, height: 30.0)


                Text("Banks and credit cards can be used to validate purchases. Cards have more processing fees.")
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
            .padding(.bottom)
            
            ForEach(globalVariables.accounts, id: \.accountId) { account in
                CardView(bankName: account.bank, accountName: account.accountName, accountMask: account.accountMask)
            }
            Spacer()
        }
        .padding()
        .navigationBarItems(trailing:
            NavigationLink(destination: AddCardView().environmentObject(globalVariables)) {
                Text("Add Account")
            }
        )
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView().environmentObject(GlobalVariables())
    }
}
