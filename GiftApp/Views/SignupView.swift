//
//  SignupView.swift
//  GiftApp
//
//  Created by Matthew Olson on 10/17/19.
//  Copyright © 2019 Molson. All rights reserved.
//

import SwiftUI
import AWSCognitoIdentityProvider

struct SignupView : View {
    @State var name: String = ""
    @State var phone: String = ""
    @State var tempPhone: String = ""
    @State var password: String = ""
    @State var phoneAlert = false
    @State var signupSuccessful = false
    @EnvironmentObject var globalVariables : GlobalVariables
    
    var body: some View {
        
            
        ZStack {

            //Background Color
            Color(red: 209/255, green: 166/255, blue: 255/255)
            .edgesIgnoringSafeArea(.vertical)
        
            VStack {
                 
                // Name
                HStack{
                    Text("Full Name")
                        .font(.body)
                        .fontWeight(.bold)
                    Image(systemName: "person.circle" )
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Spacer()
                }
                    .foregroundColor(Color.white)
                    .shadow(radius: 0.5)
           
                TextField("John Doe", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .shadow(radius: 2, x: 0, y: 2)
                
                // Phone Number
                HStack{
                    Text("Phone Number")
                        .font(.body)
                        .fontWeight(.bold)
                    Image(systemName: "phone.circle" )
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Spacer()
                }
                    .foregroundColor(Color.white)
                    .shadow(radius: 0.5)
                    .padding(.top)
                
                HStack {
                   Text("+1")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    TextField("123-456-7890", text: $tempPhone,
                      onEditingChanged: { edit in
                        
                        
                        if(self.tempPhone.count == 10) {
                            self.phone = "+1" + self.tempPhone
                            
                            let p1 = self.tempPhone.index(self.tempPhone.startIndex, offsetBy: 0)
                            let p2 = self.tempPhone.index(self.tempPhone.startIndex, offsetBy: 3)
                            let p3 = self.tempPhone.index(self.tempPhone.startIndex, offsetBy: 3)
                            let p4 = self.tempPhone.index(self.tempPhone.startIndex, offsetBy: 6)
                            let p5 = self.tempPhone.index(self.tempPhone.startIndex, offsetBy: 6)
                           
                            let r1 = p1..<p2
                            let r2 = p3..<p4
                            let r3 = p5..<self.tempPhone.endIndex
                            
                            let part1 = self.tempPhone[r1]
                            let part2 = self.tempPhone[r2]
                            let part3 = self.tempPhone[r3]
                            
                            
                            self.tempPhone = part1 + "-" + part2 + "-" + part3
                            print(self.phone)
                            self.phoneAlert = false
                        } else {
                            
                            if (!(self.tempPhone.count == 0)) {
                                self.phoneAlert = true
                            }
                        }
                        
                        
                      },
                      onCommit: {
                        print("COMITTED!")
                      })
                              
                              
                              
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    
                    .keyboardType(.numberPad)
                    
                    
                    
                }.shadow(radius: 2, x: 0, y: 2)
                
                if(self.phoneAlert) {
                    Text("YOOO")
                }
                
                
                 
                
                // Password
                 HStack{
                     Text("Password")
                         .font(.body)
                         .fontWeight(.bold)
                     Image(systemName: "lock.circle" )
                         .resizable()
                         .frame(width: 20.0, height: 20.0)
                     Spacer()
                 }
                    .shadow(radius: 0.5)
                    .foregroundColor(Color.white)
                    .padding(.top)
            
                 SecureField("8+ characters", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                        .shadow(radius: 2, x: 0, y: 2)
                
                // Submit
                NavigationLink(destination: VerifyPhoneView(phoneNumber: phone, password: password).environmentObject(globalVariables), isActive: self.$signupSuccessful) {
                    Button(action: signup) {
                        Text("send verification code")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    }
                }
                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.95))
                .cornerRadius(8)
                .padding(.vertical)
                .shadow(radius: 2, x: 0, y: 2)
                
                Spacer()
            
                
                
            
            }
                
                .padding(.horizontal, 25)
                .padding(.top)
        }
        .navigationBarTitle(Text(""),displayMode: .inline)
    }
    
    func signup() {
        let userPoolId:String = "GiftApp"
        let pool = AWSCognitoIdentityUserPool(forKey: userPoolId)
        var attributes = [AWSCognitoIdentityUserAttributeType]()
        let nameAt = AWSCognitoIdentityUserAttributeType()
        let phoneAt = AWSCognitoIdentityUserAttributeType()
        nameAt?.name = "name"
        nameAt?.value = name
        phoneAt?.name = "phone_number"
        phoneAt?.value = phone
        attributes.append(nameAt!)
        attributes.append(phoneAt!)
        
        pool.signUp(phone, password: password, userAttributes: attributes, validationData: nil).continueOnSuccessWith { (task) -> () in
            self.signupSuccessful = true
        }
    }
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(GlobalVariables())
    }
}
