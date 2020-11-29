//
//  DateOfBirthController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 13/11/2020.
//

import SwiftUI

struct DateOfBirthController: View {
    //MARK: properties
    @State var pickerDate: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    @State var selection: NavigationPushedAction? = nil
    @State var showAlert = false
    @State var alertMessage = "Something went wrong, Try again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //MARK: format the date
    let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateStyle = .medium
            return df
        }()
    
    //MARK: selectable date range, start now less 100 years and end now less 10 years
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -65, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: -17, to: Date())!
        return min...max
    }
    
    //MARK: body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("What's your date of birth?")
                  .foregroundColor(.black)
                  .font(Font.robotoBold(size: 30))
            
            Text("You must be at least 17 years to register on vyb.")
                .foregroundColor(.gray)
                .font(Font.robotoThin(size: 15))
                .padding(.bottom, 32)
            
            DatePicker("Picker", selection: $pickerDate, in: dateClosedRange, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .colorMultiply(Color.primaryVybe)
                .accentColor(Color.primaryVybe)
                .font(Font.robotoThin(size: 16))
                .frame(width: UIScreen.main.bounds.width - 32, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
           
            NavigationLink(destination:  EmptyView(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                DefaultButton(title: "Next", action:{
                    self.selection = NavigationPushedAction.phoneNumberAction
                }).clipped()
            }.padding(.top, 32)
            
            Spacer()
        }.padding([.leading,.trailing],32)
        .navigationTitle("")
        .navigationBarTitle(Text(""))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        BackIconView()
                    }
            ).alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text(Constants.displayName), message: Text("\(alertMessage)"))
            }
    }
}

struct DateOfBirthController_Previews: PreviewProvider {
    static var previews: some View {
        DateOfBirthController()
    }
}
