//
//  VerifyPhoneView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/29/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI

struct VerifyPhoneView: View {
    @State var code: String = ""
    @State var goToContent = false
    
    var body: some View {
        NavigationView {
        
        
            ZStack {

                //Background Color
                Color(red: 209/255, green: 166/255, blue: 255/255)
                .edgesIgnoringSafeArea(.vertical) // Ignore just for the color
                
                VStack {
                    TextField("Verification Code", text: $code, onEditingChanged: { _ in
                        if self.code == "00" {
                            self.goToContent = true
                        }
                    })
                        .padding()
                        .background(Color.white)
                        .cornerRadius(4.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            print("resend code")
                        }) {
                            Text("Resend Code").foregroundColor(Color.black)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(4.0)
                    
                    Spacer().frame(width: 0, height: 10, alignment: .center)
                    
                    NavigationLink(destination: ContentView(), isActive: $goToContent) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Take me to my account").foregroundColor(Color.black)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(4.0)
                }
            }
        }
    }
}

struct VerifyPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyPhoneView()
    }
}
