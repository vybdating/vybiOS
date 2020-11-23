//
//  CharacterInputView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 23/11/2020.
//

import SwiftUI

import SwiftUI

struct CharacterInputView: View {

    @State private var textValue: String = ""

    var body: some View {
        TextField("", text: $textValue, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding([.trailing, .leading], 10)
        .padding([.vertical], 15)
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.textFieldGrey.opacity(0.5), lineWidth: 1)
        )
    }

    func onCommit() {
        print("commit")
    }

    func onEditingChanged(_ changed: Bool) {
        print(changed)
    }
}

struct CharacterInputView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInputView().previewLayout(.sizeThatFits)
    }
}
