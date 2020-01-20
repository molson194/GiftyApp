//
//  AppDelegate.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider
import AWSPinpoint
import AWSMobileClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var pinpoint: AWSPinpoint?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // TODO: Enable or disable features based on authorization.
        }
        UIApplication.shared.registerForRemoteNotifications()

        
        AWSDDLog.sharedInstance.logLevel = .warning
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        let clientId:String = "5ln82jet0mufet174t84u7m1c2"
        let poolId:String = "us-east-2_zQWcOqzWf"
        let clientSecret:String = "a0eh307i1qvs0pmq75slceu281hm5ofpeochpavotde8rkjs6f1"
        let userPoolId:String = "GiftApp"
        let region:AWSRegionType = AWSRegionType.USEast2
        
        let serviceConfiguration = AWSServiceConfiguration(region: region, credentialsProvider: nil)
        let cognitoConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: clientId, clientSecret: clientSecret, poolId: poolId)
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: cognitoConfiguration, forKey: userPoolId)
        
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:region, identityPoolId:"us-east-2:d20d8fcb-4856-4c76-9a72-4122d4515922", identityProviderManager:pool)
        
        // Initialize Pinpoint
        AWSServiceManager.default().defaultServiceConfiguration = AWSServiceConfiguration(region: AWSRegionType.USEast1, credentialsProvider: credentialsProvider)
        let pinpointAppId = "bb5e579f87c34a5abf30677a1b766ce6"
        let pinpointConfiguration = AWSPinpointConfiguration(appId: pinpointAppId, launchOptions: launchOptions)
        
        pinpoint = AWSPinpoint(configuration: pinpointConfiguration)
        pinpoint?.sessionClient.startSession()

        // TODO: Add analytics events to app
        //let event = pinpoint!.analyticsClient.createEvent(withEventType: "TestEvent")
        //event.addAttribute("TestValue", forKey: "TestKey")
        //event.addMetric(1, forKey: "TestMetric")
        //let money = pinpoint!.analyticsClient.createVirtualMonetizationEvent(withProductId: "TestProduct", withItemPrice: 10.0, withQuantity: 1, withCurrency: "US")
        //pinpoint!.analyticsClient.record(event)
        //pinpoint!.analyticsClient.record(money)
        //pinpoint!.analyticsClient.submitEvents()
        
        pinpoint?.sessionClient.stopSession()
        print(pinpoint!.targetingClient.currentEndpointProfile().endpointId)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(red: 209/255, green: 166/255, blue: 255/255, alpha: 1)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(token)
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "Token")
        pinpoint!.notificationManager.interceptDidRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("failed to register for notifications")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        if (application.applicationState == .active) {
            print("notification received")
        }
    }
}
