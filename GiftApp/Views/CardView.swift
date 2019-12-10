//
//  CardView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/9/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        HStack {
            Image("second") // Bank Icon
            VStack {
                Text("Bank of America")
                Text("Bank ** 1001")
            }
            Spacer()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
