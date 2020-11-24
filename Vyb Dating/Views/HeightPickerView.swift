//
//  HeightPickerView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 23/11/2020.
//

import SwiftUI

struct HeightPickerView: View {
    //MARK: PROPERTIES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var feetSelected: Int
    @Binding var inchSelected: Int
    
    var selectHeight: String  {
        "\(feetSelected)' \(inchSelected)''"
    }
    
    //MARK: BODY
    var body: some View {
        let usefulWidth = (UIScreen.main.bounds.width - 32)
        NavigationView {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Text("SELECTED: \(selectHeight)")
                .font(Font.robotoBold(size: 16))
                .multilineTextAlignment(.center)
            HStack(alignment: .center, spacing: 4 ) {
                VStack (alignment: .center, spacing: 16) {
                    Text("Feet")
                        .font(Font.robotoBold(size: 16))
                        .multilineTextAlignment(.center)
                    Picker(selection: $feetSelected, label: Text("Feet").font(Font.robotoBold(size: 16))) {
                           ForEach(0..<10) {
                             Text("\($0)")
                                .foregroundColor(Color.primaryVybe)
                                .tag($0)
                            }
                    }
                    .colorMultiply(Color.primaryVybe)
                    .labelsHidden()
                    .frame(width: usefulWidth/2,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                }
                Spacer()
                VStack{
                    Text("Inch")
                        .font(Font.robotoBold(size: 16))
                        .multilineTextAlignment(.center)
                    Picker(selection: $inchSelected, label: Text("Inch")) {
                        ForEach(0..<10) {
                            Text("\($0)")
                                .foregroundColor(Color.primaryVybe)
                                .tag($0)
                         }
                    }
                    .frame(width: usefulWidth/2,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .labelsHidden()
                    .colorMultiply(Color.primaryVybe)
                }
            }
            //: HSTACK
            .frame(width: usefulWidth,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped()
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
                        }
            Spacer()
        }
        //: VSTACK
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Done").foregroundColor(Color.primaryVybe)
        }))
        .navigationTitle("Height Selecton")
        .navigationBarTitle(Text("Height Selecton"), displayMode: .inline)
     }
        //MARK: NAVIIGATION
    }
}


struct HeightPickerView_Previews: PreviewProvider {

    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State(initialValue: 5) var feetSelected: Int
        @State(initialValue: 2) var inchSelected: Int
        
        var body: some View {
            HeightPickerView(feetSelected: $feetSelected, inchSelected: $inchSelected).previewLayout(.sizeThatFits)
        }
    }

}
