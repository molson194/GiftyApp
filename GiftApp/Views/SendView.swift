//
//  SendView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct SendView: View {
    @State private var friend: String = ""
    @State private var vendor: String = ""
    @State private var amount: String = ""
    @State private var comment: String = ""
    @State private var payment: String = ""
    @State private var fromId: String = ""
    var body: some View {
        
        VStack {
            
            // Page Title
            VStack{
                Text("let's get gifty 🥳")
                    .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .padding(.bottom, 10.0)
            }
            
            
            
           Image("bow")
            
            
            VStack{
            
            
            // First Row
            HStack{
                // Name
                TextField("your friend's name", text: $friend)
                    .padding(.vertical, 5.0)
                
                // Amount
                TextField("$0.00 ", text: $amount)
                    .padding(.vertical, 5.0)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                
            }
            
            // Second Row
            VStack{
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))

                //Location
                TextField("location (starbucks, apple, etc.)", text: $vendor)
                    .padding(.vertical, 5.0)
                
            }
            
            // Third Row
            VStack{
                
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                
                // Comment
                TextField("write something sweet! (ex: coffee on me!)", text: $comment)
                    .padding(.bottom, 200.0)
                
                
                // Divider
                Rectangle()
                .frame(height: 3.0)
                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
             }
            
            // Fourth Row
            VStack{
                
                // Comment
                TextField("payment type", text: $payment)
                    .padding(.vertical, 5.0)
                
                
                
             }
            }.padding(25)
            
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0), lineWidth: 15)
            )
                .background(Color(red: 254/255, green: 252/255, blue: 255/255, opacity: 1.0))
                .cornerRadius(30)
                .shadow(radius: 2, x: 0, y: 4)
            
            // Button
            Button(action: sendGift, label: {
                HStack {
                    
                    Text("send your gift :)")
                        .fontWeight(.bold)
                        .font(.headline)
                        .padding()
                }
                .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                .cornerRadius(40)
                .foregroundColor(.white)
            }).padding(.top)
        }.padding()
    }
    
    func sendGift() {
        
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        pool.currentUser()?.getDetails().continueOnSuccessWith(block: { (attrTask) -> Any? in
            let taskAttributes = attrTask.result!
            let attributes = taskAttributes.userAttributes
            
            for attribute in attributes! {
                print(attribute.name!, attribute.value!)
                if attribute.name == "phone_number" {
                    self.fromId = attribute.value!
                }
            }
            
            return pool.currentUser()?.getSession()
        }).continueOnSuccessWith(block: { (task) -> () in
            let taskSession = task.result! as! AWSCognitoIdentityUserSession
            let token = taskSession.idToken?.tokenString
            let unwrappedToken = token!
            
            let params = ["fromId": self.fromId, "toId":self.friend, "paymentId":self.payment, "vendor":self.vendor, "caption": self.comment, "amount": Float(self.amount)!] as Dictionary<String, Any>
            var request = URLRequest(url: URL(string: "https://ryg6sx9jzi.execute-api.us-east-2.amazonaws.com/default/SendGift")!)
            
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("hZHTGjfHuO9GuFzoC4Ht828j93sg0htR6VTk4W4n", forHTTPHeaderField: "x-api-key")
            request.setValue(unwrappedToken, forHTTPHeaderField: "Authorization")
            
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
            })
            task.resume()
        })
    }

}
struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
