//
//  SceneDelegate.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import UIKit
import SwiftUI
import AWSCognitoIdentityProvider
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        
        let globalVariables = GlobalVariables()
        let group = DispatchGroup()
        
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        //pool.clearAll()
        let user = pool.currentUser()
        if user?.username != nil {
            
            // GLOBAL VARIABLES: get basic user info first
            globalVariables.userName = user!.username!
            group.enter()
            user!.getSession().continueWith(block: { (task) -> () in
                if let error = task.error {
                    print("Error:\(error)") // TODO: push could not sign in to user
                } else {
                    globalVariables.sessionToken = task.result!.idToken!.tokenString
                    globalVariables.loggedIn = true
                }
                group.leave()
            })
            
            group.wait()
            
            // GLOBAL VARIABLES: get account balance, user cards, and user phone number after verify user
            let params1 = ["userId": globalVariables.userName] as Dictionary<String, Any>
            var request1 = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/GetBalance")!)
            
            request1.httpMethod = "POST"
            request1.httpBody = try? JSONSerialization.data(withJSONObject: params1, options: [])
            request1.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request1.addValue("mroIKBuVeF2MZdhePl6iC2sHTnCudUBPgPeJCwCa", forHTTPHeaderField: "x-api-key")
            request1.setValue(globalVariables.sessionToken, forHTTPHeaderField: "Authorization")
            
            let session1 = URLSession.shared
            
            group.enter()
            let task1 = session1.dataTask(with: request1, completionHandler: { data, response, error -> Void in
                if data != nil{
                    print(data!)
                    let jsonDecoder = JSONDecoder()
                    do {
                        globalVariables.balance = try jsonDecoder.decode(Double.self, from: data!)
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
                group.leave()
            })
            task1.resume()
            
            let params2 = ["user": user!.username!] as Dictionary<String, Any>
            var request2 = URLRequest(url: URL(string: "https://o2yl8zqwjb.execute-api.us-east-2.amazonaws.com/default/GetAccounts")!)
            
            request2.httpMethod = "POST"
            request2.httpBody = try? JSONSerialization.data(withJSONObject: params2, options: [])
            request2.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request2.addValue("mroIKBuVeF2MZdhePl6iC2sHTnCudUBPgPeJCwCa", forHTTPHeaderField: "x-api-key")
            request2.setValue(globalVariables.sessionToken, forHTTPHeaderField: "Authorization")
            
            let session2 = URLSession.shared
            group.enter()
            let task2 = session2.dataTask(with: request2, completionHandler: { data, response, error -> Void in
                if data != nil{
                    print(String(data: data!, encoding:String.Encoding.utf8)!)
                    let jsonDecoder = JSONDecoder()
                    do {
                        globalVariables.accounts = try jsonDecoder.decode(Array<Account>.self, from: data!)
                    } catch {
                        print(error)
                    }
                }
                group.leave()
            })
            task2.resume()
            
            group.enter()
            user!.getDetails().continueWith(block: { (task) -> () in
                if let error = task.error {
                    print("Error:\(error)") // TODO: push could not get phone number to user
                } else {
                    let taskAttributes = task.result!
                    let attributes = taskAttributes.userAttributes
                    
                    for attribute in attributes! {
                        if attribute.name == "phone_number" {
                            globalVariables.phoneNumber = attribute.value!
                        }
                    }
                }
                group.leave()
            })
        
        }
        
        group.wait()
        self.presentView(scene, globalVariables: globalVariables);
    }
    
    func presentView(_ scene: UIScene, globalVariables: GlobalVariables) {
        let rootView = RootView().environmentObject(globalVariables)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

