//
//  LoginView.swift
//  GiftApp
//
//  Created by Matthew Olson on 11/28/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct LoginView: View {
    @State var phone: String = ""
    @State var password: String = ""
    @EnvironmentObject var globalVariables : GlobalVariables
    
    var body: some View {
        
            ZStack {
                // Background Color
                Color(red: 209/255, green: 166/255, blue: 255/255)  .edgesIgnoringSafeArea(.vertical)
                
                // Log-in Form
                VStack {
                    
                    // Phone Number
                    HStack{
                        Text("phone number")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        Spacer()
                    }
                    
                    TextField("", text: $phone)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                        .keyboardType(.numberPad)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    // Password
                    HStack{
                        Text("password")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                        Spacer()
                        
                    }
                    
                    TextField("",text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    // Sign in
                    
                        Button(action: login) {
                            Text("sign in :)")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                        .cornerRadius(8)
                        .padding(.vertical)
                    .shadow(radius: 2, x: 0, y: 2)
                    
                    Spacer()
                    
                }.padding(.horizontal, 30.0)
        }
    }
    // TODO: Make sure phone number is verified before going to next screen!
    func login() {
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        let user = pool.getUser(phone)
        user.getSession(phone, password: password, validationData: nil).continueOnSuccessWith(executor: AWSExecutor.mainThread(), block: { (task) -> () in
            print("user session is: \(String(describing: task.result))")
            print(user.username!)
            print(user.confirmedStatus)
            
            // TODO: get rest of global variables
            self.globalVariables.loggedIn = true
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(GlobalVariables())
        
    }
}
