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
    @State var alertMessage = "Something went wrong, Ttry again."
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //MARK: format the date
    let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateStyle = .medium
            return df
        }()
    
    //MARK: selectable date range, start now less 100 years and end now less 10 years
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: -10, to: Date())!
        return min...max
    }
    
    //MARK: body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("What's your date of birth?")
                  .foregroundColor(.black)
                  .font(Font.system(size: 30, weight: .bold))
            
            Text("Your date of birth will really help.")
                .foregroundColor(.gray)
                .font(.body)
                .padding(.bottom, 32)
            
            DatePicker("Picker", selection: $pickerDate, in: dateClosedRange, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            
            NavigationLink(destination: PhoneNumberController(), tag: NavigationPushedAction.phoneNumberAction, selection: $selection) {
                DefaultButton(title: "Next", action:{
                    self.selection = NavigationPushedAction.phoneNumberAction
                }).clipped()
            }.padding(.top, 64)
            
            Spacer()
        }.padding([.leading,.trailing],32)
        .navigationTitle("")
        .navigationBarTitle(Text(""))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("NavigationBack")
                            .resizable()
                            .imageScale(.large)
                            .scaledToFit()
                            .frame(width: 32, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipped()
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
