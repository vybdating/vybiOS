//
//  PickerInputView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 12/11/2020.
//

import SwiftUI

struct PickerInputView: View {
    //MARK: Properties
    @State var selectedType: String = ""
    var placeHolder: String = ""
    var options: [String] = []
    @State private var optionActions: [ActionSheet.Button] = []
    private var selection: (String) -> Void
    @State private var showingActionSheet = false
    
    //MARK: init this action
    init(placeHolder: String, options: [String], selection: @escaping (String) -> Void) {
        self.selection = selection
        self.options = options
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        Button(action: {
            self.showingActionSheet = true
        }) {
            HStack(spacing: 0) {
                Text(self.selectedType.isEmpty ? placeHolder : self.selectedType)
                    .font(.headline)
                    .foregroundColor(self.selectedType.isEmpty ? Color.gray : Color.primaryVybe)
                Spacer()
                Image("DownArrow")
                    .resizable()
                    .imageScale(.small)
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipped()
         
            }.padding(16)
         //: BUTTON
        }.accentColor(.black)
        .foregroundColor(.black)
        .background(RoundedRectangle(cornerRadius: 44)
                        .stroke(Color.textFieldGrey, lineWidth: 0)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .frame(width: .infinity, height: 44, alignment: .leading)
                        .background(Color.textFieldGrey)
                        .cornerRadius(44))
        .cornerRadius(22)
        .padding([.top, .bottom], 0)
        .font(Font.system(size: 19, weight: .semibold))
        .frame(width: .infinity, height: 44, alignment: .leading)
        .clipped()
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text(Constants.displayName), message: Text("Select Action"), buttons: optionActions
            )
        }.onAppear(){
            options.forEach { actionText in
                optionActions.append(ActionSheet.Button.default(Text(actionText), action: {
                    self.selection(actionText)
                    self.selectedType = actionText
                }))
            }
            optionActions.append(ActionSheet.Button.cancel())
        }
    }
}

struct PickerInputView_Previews: PreviewProvider {
    static var previews: some View {
        PickerInputView(placeHolder: "Height", options: ["Test 1", "Test 2"], selection: {_ in
            
        } ).previewLayout(.sizeThatFits)
    }
}
