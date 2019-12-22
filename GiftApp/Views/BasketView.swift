//
//  BasketView.swift
//  GiftApp
//
//  Created by Michael Olson on 11/30/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct BasketView: View {
    @State private var phoneNumber: String = ""
    @State private var myGifts: Array<Gift> = []
    var body: some View {
        List {
            VStack {
                if myGifts.count > 0 {
                    ForEach(0...myGifts.count-1, id: \.self) {ippp in
                        GiftView(gift: self.myGifts[ippp]).padding(.top)
                    }
                }
            }
        }.onAppear(perform: getGifts)
    
        //TODO: Don't reload from db. Cache obhects and pull to refresh.
        
    }
    
    func getGifts() {
        print("here")
        // get user phone number
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        pool.currentUser()?.getDetails().continueOnSuccessWith(block: { (attrTask) -> Any? in
            let taskAttributes = attrTask.result!
            let attributes = taskAttributes.userAttributes
            
            for attribute in attributes! {
                print(attribute.name!, attribute.value!)
                if attribute.name == "phone_number" {
                    self.phoneNumber = attribute.value!
                }
            }
            
            return pool.currentUser()?.getSession()
        }).continueOnSuccessWith(block: { (task) -> () in
            // make lambda api call
            let taskSession = task.result! as! AWSCognitoIdentityUserSession
            let token = taskSession.idToken?.tokenString
            let unwrappedToken = token!
            
            let params = ["phoneNumber": self.phoneNumber] as Dictionary<String, Any>
            var request = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/GetGifts")!)
            
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("mroIKBuVeF2MZdhePl6iC2sHTnCudUBPgPeJCwCa", forHTTPHeaderField: "x-api-key")
            request.setValue(unwrappedToken, forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                if data != nil{
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.myGifts = try jsonDecoder.decode(Array<Gift>.self, from: data!)
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
        // return list of gift objects
        // for each object make a new gift view
    }
}

public struct Gift : Codable {
    public let fromId:String
    public let vendor:String
    public let caption:String
    public let remainingBalance:String
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
