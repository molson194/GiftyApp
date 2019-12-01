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
            // Background Color
            Color(red: 209/255, green: 166/255, blue: 255/255)  .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    
                    // Verification Code
                    HStack{
                        Text("verification code")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                        Spacer()
                        
                    }
                    
                    TextField("", text: $code, onEditingChanged: { _ in
                        if self.code == "00" {
                            self.goToContent = true
                        }
                    })
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    
                        
                    // Resend Code
                    Button(action: {
                        print("resend code")
                    }) {
                        Text("resend code")
                           .font(.headline)
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                            .padding()
                    }
                    .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                    .cornerRadius(8)
                    .padding(.vertical)
                    
                    
                    
                    NavigationLink(destination: ContentView(), isActive: $goToContent) {
                        
                        Text("take me to my account :)")
                            .font(.headline)
                            .padding()
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    }
                    
                    .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                    .cornerRadius(8)
                
                
                    
                    
                    
                }.padding(.horizontal, 30.0)
            }
        }
    }
}

struct VerifyPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyPhoneView()
    }
}
