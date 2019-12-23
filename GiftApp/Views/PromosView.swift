//
//  PromosView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct PromosView: View {
    var body: some View {
        VStack {
            Text("nothing to see here.")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .multilineTextAlignment(.center)
                
            Text("just smile and wave boys.")
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Text("smile and wave...")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .multilineTextAlignment(.center)
            
            Image("avocado")
                .resizable()
                .frame(width: 133.0, height: 150.0)
            
        }
        .padding(.all)
    }
}

struct PromosView_Previews: PreviewProvider {
    static var previews: some View {
        PromosView()
    }
}
