//
//  BankTransferView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct BankTransferView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Transfer to")
                Spacer()
            }
            .padding()
        }
    }
}

struct BankTransferView_Previews: PreviewProvider {
    static var previews: some View {
        BankTransferView()
    }
}
