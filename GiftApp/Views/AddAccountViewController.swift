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
        var phone = ""
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
            print("Successfully linked account!\npublicToken:\(publicToken)\nmetadata: \(metadata ?? [:])")
            let institution = metadata!["institution"] as! [String : Any]
            let bankName = institution["name"]
            
            
            let userPoolId:String = "GiftApp"
            let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
            let user = pool.currentUser()
            user!.getDetails().continueOnSuccessWith(block: { (attrTask) -> Any? in
                let taskAttributes = attrTask.result!
                let attributes = taskAttributes.userAttributes
                
                for attribute in attributes! {
                    print(attribute.name!, attribute.value!)
                    if attribute.name == "phone_number" {
                        self.phone = attribute.value!
                    }
                }
                
                return user!.getSession()
            }).continueOnSuccessWith(block: { (task) -> () in
                let taskSession = task.result! as! AWSCognitoIdentityUserSession
                let token = taskSession.idToken?.tokenString
                let unwrappedToken = token!
                
                let params = ["username": user!.username!, "phone":self.phone, "bankName":bankName!, "accessToken":publicToken] as Dictionary<String, Any>
                var request = URLRequest(url: URL(string: "https://v1dv1bik8f.execute-api.us-east-2.amazonaws.com/default/AddUpdateAccount")!)
                
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("0QsmVHhynj3lR4Y4V6QdY3Igckgen1EV8UZMrXXN", forHTTPHeaderField: "x-api-key")
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
            
            presentationMode.dismiss()
        }
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
            print("Failed to link account due to: \(error?.localizedDescription ?? "no error :)")\nmetadata: \(metadata ?? [:])")
            presentationMode.dismiss()
        }

        init(_ addAccountViewController: AddAccountViewController, presentationMode: Binding<PresentationMode>) {
            _presentationMode = presentationMode
        }
    }
}
