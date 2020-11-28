//
//  RowModifier.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

struct RowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
                .offset(x: 16, y: 16)
        }
    }
}
