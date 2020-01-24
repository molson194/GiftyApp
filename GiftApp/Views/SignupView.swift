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
    @State var password: String = ""
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
                    Text("name")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                    
                    Spacer()
                }
           
                TextField("", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                    .accentColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                
                // Phone Number
                 HStack{
                     Text("phone number")
                     .font(.body)
                     .fontWeight(.bold)
                     .foregroundColor(Color.white)
                     .multilineTextAlignment(.leading)
                     .padding([.top, .leading])
                    
                     Spacer()
                 }
            
                 TextField("", text: $phone)
                     .padding()
                     .background(Color.white)
                     .cornerRadius(8)
                     .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                .keyboardType(.numberPad)
                
                // Password
                 HStack{
                     Text("password")
                     .font(.body)
                     .fontWeight(.bold)
                     .foregroundColor(Color.white)
                     .multilineTextAlignment(.leading)
                     .padding([.top, .leading])
                     
                     Spacer()
                 }
            
                 SecureField("", text: $password)
                     .padding()
                     .background(Color.white)
                     .cornerRadius(8)
                     .foregroundColor(Color(red: 209/255, green: 166/255, blue: 255/255, opacity: 1.0))
                
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
                
            
            }.padding(.horizontal, 30.0)
        }
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

struct CustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        var didBecomeFirstResponder = false

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

    }

    @Binding var text: String
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

struct ResponderTextField: UIViewRepresentable {

    typealias TheUIView = UITextField
    var isFirstResponder: Bool
    var configuration = { (view: TheUIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> TheUIView { TheUIView() }
    func updateUIView(_ uiView: TheUIView, context: UIViewRepresentableContext<Self>) {
        _ = isFirstResponder ? uiView.becomeFirstResponder() : uiView.resignFirstResponder()
        configuration(uiView)
    }
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(GlobalVariables())
    }
}
