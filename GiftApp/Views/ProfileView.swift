//
//  ProfileView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct ProfileView: View {
    @State private var balance: String = "?"
    var body: some View {
        VStack{
            
            // Main Card
            VStack {
                
                // Profile Image and Name
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "rectangle.stack.person.crop")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                        .padding()
                        
                        Text("Matthew Olson")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .padding(.bottom)
                    }
                    Spacer()
                }.background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                      
                // Balance
                HStack{
                    Spacer()
                    Text("Balance: $" + balance)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                .background(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
            }
            .cornerRadius(20)
            .shadow(radius: 3, x: 0, y: 0)
            
            
            // Buttons
            VStack{
                
                // Transfer to Bank Account
                HStack{
                    Spacer()
                    NavigationLink(destination: BankTransferView()) {
                        Text("transfer balance to bank")
                            .fontWeight(.heavy)
                            .font(.headline)
                          .padding()
                          .foregroundColor(.white)
                    }
                    Spacer()
                }.background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1))
                .cornerRadius(20)
                    .padding(.all)
                
                // Add and Edit Cards Link
                HStack {
                    Spacer()
                    NavigationLink(destination: CardsView()) {
                        Text("add and edit cards")
                          .fontWeight(.bold)
                          .font(.headline)
                          .padding()
                          .foregroundColor(.white)
                    }
                    Spacer()
                }
                .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1))
                .cornerRadius(20)
                    .padding([.leading, .bottom, .trailing])
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: getBalance)
    }
    
    func getBalance() {
        print("here")
        // get user phone number
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        let userId = (pool.currentUser()?.username)!
        
        pool.currentUser()?.getSession().continueOnSuccessWith(block: { (task) -> () in
            // make lambda api call
            let taskSession = task.result!
            let token = taskSession.idToken?.tokenString
            let unwrappedToken = token!
            
            let params = ["userId": userId] as Dictionary<String, Any>
            var request = URLRequest(url: URL(string: "https://3dyfpu69cg.execute-api.us-east-2.amazonaws.com/default/GetBalance")!)
            
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("IZNFK8M0xK9Q8qCEqJyBL5vncsDcajIN7PI2Ojhx", forHTTPHeaderField: "x-api-key")
            request.setValue(unwrappedToken, forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                if data != nil{
                    print(data!)
                    let jsonDecoder = JSONDecoder()
                    do {
                        let floatBalance = try jsonDecoder.decode(Float.self, from: data!)
                        self.balance = NSString(format: "%.2f", floatBalance) as String
                    } catch {
                        print(error)
                    }
                }
                
                if response != nil{
                    print(response!)
                }
                
                if error != nil{
                    print(error!)
                }
            })
            task.resume()
        })
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
