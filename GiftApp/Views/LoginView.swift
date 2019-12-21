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
    @State var loginSuccessful = false
    
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
                    NavigationLink(destination: ContentView(), isActive: self.$loginSuccessful) {
                        Button(action: login) {
                            Text("sign in :)")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                        .cornerRadius(8)
                        .padding(.vertical)
                    }
                    
                }.padding(.horizontal, 30.0)
        }
    }
    
    func login() {
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        let user = pool.getUser(phone)
        user.getSession(phone, password: password, validationData: nil).continueOnSuccessWith { (task) -> () in
            print("user session is: \(String(describing: task.result))")
            print(user.username!)
            print(user.confirmedStatus)
            self.loginSuccessful = user.isSignedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
