//
//  ThankYouView.swift
//  GiftApp
//
//  Created by Michael Olson on 1/9/20.
//  Copyright © 2020 Molson. All rights reserved.
//

import SwiftUI

struct ThankYouView: View {
    var body: some View {
        VStack {
            Text("we're coding stuff")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .multilineTextAlignment(.center)
                
            Text("to make it easier ")
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Text("to say thank you!")
                .font(.title)
                .fontWeight(.medium)
                .padding([.top, .leading, .trailing])
                .multilineTextAlignment(.center)
            
            Text("🍻☺️")
                .font(.system(size: 75))
                .fontWeight(.medium)
                .padding([.top, .leading, .trailing])
                .multilineTextAlignment(.center)
        }
        .navigationBarTitle(Text("Thank Yous"),displayMode: .inline)
    }
     
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView()
    }
}
