//
//  SettingsRowView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 22/11/2020.
//

import SwiftUI

struct SettingsRowView: View {
    //MARK: PROPERTIES
    var title: String
    var value: String
    var icon: String
    
    //MARK: BODY
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(Color.gray)
                .frame(width: 36, height: 36, alignment: .center)
            Text(title).foregroundColor(.gray)
            Spacer()
            Text(value)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            
        }.padding(0)
        .cornerRadius(0)
        .background(Color.clear)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: Constants.displayName, value: "0", icon: "gear").previewLayout(.sizeThatFits)
    }
}
