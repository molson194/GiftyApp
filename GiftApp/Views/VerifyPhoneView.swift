//
//  VerifyPhoneView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/29/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct VerifyPhoneView: View {
    var phoneNumber: String
    var password: String
    @State var code: String = ""
    @EnvironmentObject var globalVariables : GlobalVariables
    
    var body: some View {
    
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
                      // TODO: Auto verify code without press of button.
                    }
                })
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                
                
                    
                // Resend Code
                Button(action: {
                    print("resend code")
                    let userPoolId:String = "GiftApp"
                    let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
                    let user = pool.getUser(self.phoneNumber)
                    user.resendConfirmationCode()
                }) {
                    Text("resend code")
                       .font(.headline)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        .padding()
                }
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .cornerRadius(8)
                .padding(.vertical)
                
                    Button(action:{
                        let userPoolId:String = "GiftApp"
                        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
                        let user = pool.getUser(self.phoneNumber)
                        user.verifyAttribute("phone_number", code: self.code)
                        user.confirmSignUp(self.code).continueOnSuccessWith { (task) -> (AWSTask<AWSCognitoIdentityUserSession>) in
                            return user.getSession(self.phoneNumber, password: self.password, validationData: nil)
                        }.continueOnSuccessWith(executor: AWSExecutor.mainThread(), block: { (task) -> () in
                            // TODO: get rest of global variables
                            self.globalVariables.loggedIn = true
                        })
                    }) {
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


struct VerifyPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyPhoneView(phoneNumber: "phone", password: "pass").environmentObject(GlobalVariables())
    }
}
