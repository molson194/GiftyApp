//
//  CardsView.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/8/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct CardsView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Banks have free transfers. Both banks and credit cards can be used to validate purchases")
                .padding()
            
            HStack {
                Text("Banks")
                Spacer()
            }
            
            List {
                ForEach(1...3, id: \.self) {i in
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        CardView()
                    }.alert(isPresented: self.$showingAlert) {
                        Alert(title: Text("Do you want to remove this card"), message: Text("Card \(i)"), dismissButton: .default(Text("Delete")))
                    }
                }
            }
            .padding()
            
            HStack {
                Text("Credit Cards")
                Spacer()
            }
            
            List {
                ForEach(1...2, id: \.self) {_ in
                    CardView()
                }
            }
            .padding()
            
        }
        .navigationBarItems(trailing:
            NavigationLink(destination: AddCardView()) {
                Text("Add Account")
            }
        )
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
