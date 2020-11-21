//
//  NumberInputView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 11/11/2020.
//

import SwiftUI

struct NumberInputView: View {
    //MARK: Prooperties
    @State var phoneNumber: String = ""
    @State var countryFlag: String = "US"
    @State var code: String = "1"
    private let action: () -> Void
    
    private func getinfo()  {
        if let locale = Locale.current.regionCode {
            let localCountryCode = Mics.getCountryCallingCode(countryRegionCode: locale)
            self.countryFlag = locale.uppercased().toEmoji()
            self.code = "+\(localCountryCode)"
            print("CODE \(locale.uppercased())")
        }
    }
    
    //MARK: set the action
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    //MARK: Body
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Spacer()
            Button(action: self.action) {
                HStack (alignment: .center, spacing: 0) {
                    Text("\(self.countryFlag)")
                        .frame(width: 30, height: 30, alignment: .center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .clipped()
                        .onAppear {
                            self.getinfo()
                        }
                    
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
            
            TextField("Enter Phone Number", text: $phoneNumber)
                .textContentType(.telephoneNumber)
                .keyboardType(.numberPad)
                .padding([.top,.bottom],16)
                .padding([.leading,.trailing],4)
                .font(.title3)
                .foregroundColor(Color.black)
                .accentColor(Color.black)
                .background(Color.clear)
        }.background(RoundedRectangle(cornerRadius: 40).fill(Color.textFieldGrey))
    
    }
}

struct NumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputView(action: {
            
        }).previewLayout(.sizeThatFits)
    }
}
