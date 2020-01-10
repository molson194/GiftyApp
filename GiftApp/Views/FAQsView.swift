//
//  FAQsView.swift
//  GiftApp
//
//  Created by Michael Olson on 1/9/20.
//  Copyright © 2020 Molson. All rights reserved.
//

import SwiftUI

struct FAQsView: View {
   
    let myList = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
                  "It is a long established fact that a reader will be distracted by the readable content of a page when "]
    var body: some View {
    
        List {
        
           ForEach(myList, id: \.self) {item in
               
            VStack {
                HStack {
                    Text(item)
                    Spacer()
                }
                .padding()
                .background(Color.white)
            }
            .cornerRadius(20)
            .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
            
            
            
            
           }
        
        }
        .navigationBarTitle(Text("FAQs"),displayMode: .inline)
    }
}



struct FAQsView_Previews: PreviewProvider {
    static var previews: some View {
        FAQsView()
    }
}
