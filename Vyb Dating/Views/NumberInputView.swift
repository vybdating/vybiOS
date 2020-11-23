//
//  NumberInputView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct NumberInputView: View {
    
    //MARK: Properties
    @State private var country: CountryItem? = nil
    @State private var showCountryView = false
    
    @Binding var code: String
    @Binding var number: String
    
    private func getinfo()  {
        if let locale = Locale.current.regionCode {
            guard let localCountryCode = Mics.getCountryCallingCode(countryRegionCode: locale) else {return}
            let countryFlag = locale.uppercased().toEmoji()
            
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: localCountryCode])

            var name = ""
            name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? ""
            
            self.country = CountryItem(id: localCountryCode, name: name, code: localCountryCode, imageName: countryFlag)
             self.code = "+"  + localCountryCode
            }
    }
    
    //MARK: Body
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Spacer()
            Button(action: {
                self.showCountryView = true
                print("STARTS")
            }) {
                HStack (alignment: .center, spacing: 0) {
                    Text("\(self.country?.imageName ?? "")")
                        .frame(width: 30, height: 30, alignment: .center)
                        .font(Font.robotoBold(size: 30))
                        .clipped()
                      
                    Image("DownArrow")
                        .resizable()
                        .imageScale(.small)
                        .frame(width: 12, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .padding([.leading,.trailing],4)
                        .clipped()
                }
            }
            
            Rectangle()
                .foregroundColor(Color.black.opacity(0.5))
                .frame(width: 1, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Rectangle().fill(Color.white.opacity(0.8)))
                .clipped()
            
            TextField("Enter Phone Number", text: $number)
                .textContentType(.telephoneNumber)
                .keyboardType(.numberPad)
                .padding([.top,.bottom],16)
                .padding([.leading,.trailing],16)
                .font(Font.robotoThin(size: 20))
                .background(Color.clear)
        }.sheet(isPresented: $showCountryView) {
            CountryPickerView { (item) in
                self.country = item
                guard let dialCoode = Mics.getCountryCallingCode(countryRegionCode: item.code) else {return}
                self.code = "+"  + dialCoode
            }
        }
        .onAppear(){
            getinfo()
        }
        .background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
    
    }
}

struct NumberInputView_Previews: PreviewProvider {

    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State(initialValue: "") var code: String
        @State(initialValue: "") var number: String
        
        var body: some View {
            NumberInputView(code: $code, number: $number).previewLayout(.sizeThatFits)
        }
    }

}
