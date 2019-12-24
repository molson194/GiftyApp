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
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
            print("Successfully linked account!\npublicToken:\(publicToken)\nmetadata: \(metadata ?? [:])")
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
