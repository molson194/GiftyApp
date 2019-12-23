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
            VStack{
                VStack{
                    
                    // Image Chain
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 35.0, height: 35.0)
                            .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                        if !friend.isEmpty {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(Color.gray)
                                
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 35.0, height: 35.0)
                                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                                
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .frame(width: 35.0, height: 35.0)
                                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                    
                        if !vendor.isEmpty && !amount.isEmpty && !friend.isEmpty {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(Color.gray)
                                
                            Image(systemName: "pencil.tip.crop.circle")
                                .resizable()
                                .frame(width: 35.0, height: 35.0)
                                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                    
                        if !comment.isEmpty && !vendor.isEmpty && !amount.isEmpty && !friend.isEmpty {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(Color.gray)
                                
                            Image(systemName: "creditcard")
                                .resizable()
                                .frame(width: 40.0, height: 35.0)
                                .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        }
                    }
                    // First Row
                    VStack{
                        // Name
                        ZStack(alignment: .center) {
                            if friend.isEmpty {
                                Text("Who's getting the gift?")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                            }
                            TextField(" ", text: $friend)
                                .font(.system(size: 30, weight: .bold))
                                .multilineTextAlignment(.center)
                            }
                        
                    }
                    
                    if !friend.isEmpty {
                        // Second Row
                        
                        // Divider
                        Rectangle()
                        .frame(height: 4.0)
                        .foregroundColor(Color.black)
                        
                        VStack{
                            HStack {
                                //Location
                                ZStack(alignment: .leading) {
                                    if vendor.isEmpty {
                                        Text("Location ")
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 18))
                                            .padding(.vertical, 5.0)
                                    }
                                    TextField(" ", text: $vendor)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.leading)
                                        .padding(.vertical, 5.0)
                                }
                            
                                // Amount
                                ZStack(alignment: .trailing) {
                                    if amount.isEmpty {
                                        Text("$0.00")
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 18))
                                            .padding(.vertical, 5.0)
                                    }
                                    TextField(" ", text: $amount)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.trailing)
                                        .padding(.vertical, 5.0)
                                }
                            }
                            
                            
                            
                        }
                    }
                    
                    if !vendor.isEmpty && !amount.isEmpty && !friend.isEmpty {
                        // Third Row
                        
                        // Divider
                        Rectangle()
                        .frame(height: 1.0)
                        .foregroundColor(Color.black)
                        
                        VStack{
                            // Comment
                            ZStack(alignment: .leading) {
                                if comment.isEmpty {
                                    Text("write something sweet!")
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18))
                                        .padding(.bottom, 100)
                                }
 
                                TextField(" ", text: $comment)
                                    .font(.system(size: 18, weight: .bold))
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 100)
                            }
                            
                            
                         }
                    }
                    
                    if !comment.isEmpty && !vendor.isEmpty && !amount.isEmpty && !friend.isEmpty {
                        // Fourth Row
                        
                        
                        // Divider
                        Rectangle()
                        .frame(height: 1.0)
                        .foregroundColor(Color.black)
                        
                        VStack{
                            // Payment type
                            ZStack(alignment: .leading) {
                               if payment.isEmpty {
                                   Text("Payment Type ")
                                       .fontWeight(.bold)
                                       .foregroundColor(.gray)
                                       .font(.system(size: 18))
                                       .padding(.vertical, 5.0)
                               }
                            TextField(" ", text: $payment)
                                .font(.system(size: 18, weight: .bold))
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 5.0)
                                
                            }
   
                         }
                    }
                }
                .padding(22)
                .background(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
            }
            .cornerRadius(20)
            .shadow(color: Color.gray,radius: 4, x: 0, y: 1)
               
            // Button
        
            if !payment.isEmpty && !comment.isEmpty && !vendor.isEmpty && !amount.isEmpty && !friend.isEmpty{
            Button(action: sendGift, label: {
                HStack {
                    Spacer()
                    Image(systemName: "gift")
                    Text("send your gift :)")
                        .fontWeight(.bold)
                        .font(.headline)
                        .padding([.top, .bottom, .trailing])
                    Spacer()
                }
                .background(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                .cornerRadius(20)
                .foregroundColor(.white)
            }).padding()
            }
            Spacer();
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
