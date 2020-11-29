//
//  GenderSelectionController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 29/11/2020.
//

import SwiftUI

struct GenderSelectionController: View {
    //MARK: PROPERTIES
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selectedProfileGender = 1
    @State var selectedPrefGender = 0
    let genderOptions = [Segment(id: 0, segmentName: "Male", segmentImage: "Male"), Segment(id: 1, segmentName: "Female", segmentImage: "Female"), Segment(id: 2, segmentName: "Trans", segmentImage: "Transgender")]
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
           
           Text("How do you identify as?")
               .foregroundColor(.black)
               .font(Font.robotoBold(size: 30))
               
            
           SegmentedControlView(selected: $selectedProfileGender, segments: genderOptions)
                
            
            Text("Who do you want to date?")
                .foregroundColor(.gray)
                .font(Font.robotoThin(size: 15))
                .padding(.top, 32)
                .padding(.bottom, 4)
            
            SegmentedControlView(selected: $selectedPrefGender, segments: genderOptions)
            
        
            NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.preferenceAction, selection: $selection) {
                DefaultButton(title: "Next", action:{
                    self.selection = NavigationPushedAction.preferenceAction
                }).clipped()
            }.padding(.top, 64)
            
            
           Spacer()
        }
        //VSTACK
        .padding([.leading,.trailing],32)
        .navigationTitle("")
        .navigationBarTitle(Text(""))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                       BackIconView()
                    }
            )
    }
}

struct GenderSelectionController_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionController()
    }
}
