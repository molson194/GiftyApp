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
    @State private var myGifts: Array<Gift> = []
    @EnvironmentObject var globalVariables : GlobalVariables
    var body: some View {
        List {
            VStack {
                ForEach(myGifts, id: \.id) {myGift in
                    GiftView(gift: myGift).padding(.top)
                }
            }
        }.onAppear(perform: getGifts)
    
        //TODO: Don't reload from db. Cache obhects and pull to refresh.
    }
    
    func getGifts() {
        let params = ["phoneNumber": globalVariables.phoneNumber] as Dictionary<String, Any>
        var request = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/GetGifts")!)
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("mroIKBuVeF2MZdhePl6iC2sHTnCudUBPgPeJCwCa", forHTTPHeaderField: "x-api-key")
        request.setValue(globalVariables.sessionToken, forHTTPHeaderField: "Authorization")
        
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
    }
}

public struct Gift : Codable {
    public let id:Int
    public let fromId:String
    public let vendor:String
    public let caption:String
    public let remainingBalance:String
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView().environmentObject(GlobalVariables())
    }
}
