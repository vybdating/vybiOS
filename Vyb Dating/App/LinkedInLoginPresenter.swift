//
//  LinkedInLoginPresenter.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI
import UIKit


struct LinkedInLoginPresenter: UIViewControllerRepresentable {
   
    @Binding var linkedInData: LinkedInData?
    @Environment(\.presentationMode) var presentationMode

    
    func makeCoordinator() -> LinkedInLoginPresenter.Coordinator {
            return Coordinator(self)
        }
        
    func makeUIViewController(context: Context) -> LinkedInLoginController {
            let picker = LinkedInLoginController()
            return picker
    }
        
    func updateUIViewController(_ uiViewController: LinkedInLoginController, context: Context) {
            
    }
}

extension LinkedInLoginPresenter {

    class Coordinator: NSObject {
        var parent: LinkedInLoginPresenter
        @Environment(\.presentationMode) var presentationMode

        init(_ parent: LinkedInLoginPresenter) {
            self.parent = parent
        }

        func controllerDidFinish(_ viewController: LinkedInLoginController) {
            parent.linkedInData = viewController.linkedInData
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
