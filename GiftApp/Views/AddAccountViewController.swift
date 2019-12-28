//
//  AddAccountViewController.swift
//  GiftApp
//
//  Created by Matthew Olson on 12/23/19.
//  Copyright © 2019 Molson. All rights reserved.
//


import SwiftUI
import UIKit
import LinkKit
import AWSCognitoIdentityProvider

struct AddAccountViewController: UIViewControllerRepresentable {
    @EnvironmentObject var globalVariables : GlobalVariables
    
    @Environment(\.presentationMode)
    var presentationMode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, presentationMode: presentationMode)
    }
    
    func makeUIViewController(context: Context) -> PLKPlaidLinkViewController {
        print("adhhdha")
        let linkViewController = PLKPlaidLinkViewController(delegate:context.coordinator)
        return linkViewController
    }

    func updateUIViewController(_ pageViewController: PLKPlaidLinkViewController, context: Context) { }
    
    class Coordinator: NSObject, PLKPlaidLinkViewDelegate {
        @Binding var presentationMode: PresentationMode
        var parent : AddAccountViewController
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
            print("Successfully linked account!\npublicToken:\(publicToken)\nmetadata: \(metadata ?? [:])")
            let institution = metadata!["institution"] as! [String : Any]
            let bankName = institution["name"]
            let accounts = metadata!["accounts"] as! [NSArray]
            
            
            let params = ["username":parent.globalVariables.userName, "phone":parent.globalVariables.phoneNumber, "bankName":bankName!, "accessToken":publicToken, "accounts":accounts] as Dictionary<String, Any>
            var request = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/AddUpdateAccount")!)
            
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("mroIKBuVeF2MZdhePl6iC2sHTnCudUBPgPeJCwCa", forHTTPHeaderField: "x-api-key")
            request.setValue(parent.globalVariables.sessionToken, forHTTPHeaderField: "Authorization")
            
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
            
            // TODO: add accounts to global variable
            
            presentationMode.dismiss()
        }
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
            print("Failed to link account due to: \(error?.localizedDescription ?? "no error :)")\nmetadata: \(metadata ?? [:])")
            presentationMode.dismiss()
        }

        init(_ addAccountViewController: AddAccountViewController, presentationMode: Binding<PresentationMode>) {
            parent = addAccountViewController
            _presentationMode = presentationMode
        }
    }
}
