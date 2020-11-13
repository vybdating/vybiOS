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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What's your date of birth?")
                  .foregroundColor(.black)
                  .font(Font.system(size: 30, weight: .bold))
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
    }
}

struct DateOfBirthController_Previews: PreviewProvider {
    static var previews: some View {
        DateOfBirthController()
    }
}
