//
//  .swift
//  GiftApp
//
//  Created by Michael Olson on 12/21/19.
//  Copyright © 2019 Molson. All rights reserved.
//
import Foundation

class GlobalVariables: ObservableObject {
    @Published var loggedIn : Bool = false
    @Published var sessionToken : String = ""
    @Published var userName : String = ""
    @Published var phoneNumber : String = ""
    @Published var balance : Double = 0.0
    @Published var accounts : [Account] = []
}
