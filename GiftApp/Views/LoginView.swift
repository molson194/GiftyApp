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
                        Spacer()
                    }
                    
                    TextField("", text: $phone)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                            .keyboardType(.numberPad)
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    // Password
                    HStack{
                        Text("password")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                        Spacer()
                        
                    }
                    
                    SecureField("",text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
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
                    
                }
                .padding(.horizontal, 25)
                .padding(.top)
        }
            .navigationBarTitle(Text(""),displayMode: .inline)
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
            
            let defaults = UserDefaults.standard
            let deviceToken = defaults.string(forKey: "Token") ?? ""
            print(deviceToken)
            
            if deviceToken != "" {
                // upload token, userid, phone number to database in cloud
                let params = ["user": user.username!, "token":deviceToken] as Dictionary<String, Any>
                var request = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/DeviceToken")!)
                
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("AvH4fxu8GSaYZ3vGxVSTka5uAcZYFq237ZER85Q5", forHTTPHeaderField: "x-api-key")
                request.setValue(task.result!.idToken!.tokenString, forHTTPHeaderField: "Authorization")
                
                let session = URLSession.shared
                let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                    if data != nil{
                        print(data!)
                    }
                    
                    if response != nil{
                        print(response!)
                    }
                    
                    if error != nil{
                        print(error!)
                    }
                    
                    self.globalVariables.loggedIn = true
                })
                task.resume()
            } else {
                self.globalVariables.loggedIn = true
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(GlobalVariables())
        
    }
}
