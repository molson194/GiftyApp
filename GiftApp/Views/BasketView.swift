//
//  BasketView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct BasketView: View {
    var body: some View {
        NavigationView {
            
            List {
                VStack {
                    ForEach(1...5, id: \.self) {_ in
                        GiftView()
                    }
                }
            }
        .navigationBarTitle(Text("Basket"))
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
