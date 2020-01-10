//
//  FeedView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            Text("we're working on it...")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .multilineTextAlignment(.center)
                
            Text("but we get tired,")
                .font(.title)
                .fontWeight(.medium)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Text("come back soon! 😴")
                .font(.title)
                .fontWeight(.medium)
                .padding()
                .multilineTextAlignment(.center)
            
            Image("sloth")
                .resizable()
            .frame(width: 150.0, height: 150.0)
            
        }
        .padding(.all)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
