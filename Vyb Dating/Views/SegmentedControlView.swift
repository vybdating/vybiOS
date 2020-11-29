//
//  SegmentedControlView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 29/11/2020.
//

import SwiftUI

struct Segment: Identifiable {
    var id: Int
    var segmentName: String
    var segmentImage: String
}

struct SegmentedControlView: View {
    @Binding var selected : Int
    var segments: [Segment]

    var body: some View {
        let width = (UIScreen.main.bounds.width - 64)/3
        HStack(alignment: .center, spacing: 4) {
            ForEach(segments) { segment in
                Button(action: {
                    self.selected = segment.id
                })
                {
                    VStack(alignment: .center, spacing: 2) {
                        Image(segment.segmentImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44,height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.gray, lineWidth: 1)
                                                .background(Color.clear)
                                                .cornerRadius(2)
                            )
                        
                        Text(segment.segmentName.uppercased())
                            .padding(8)
                            .font(Font.robotLight(size: 14))
                    }
                    //: VSTACK
                    
                    
                }
                //: BUTON
                .foregroundColor(self.selected == segment.id ? Color.primaryVybe : Color.black)
                .frame(width: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        .padding(8)
        .clipShape(Capsule())
        .animation(.default)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(selected: .constant(0), segments: [Segment(id: 0, segmentName: "Popular", segmentImage: "Male"), Segment(id: 1, segmentName: "New", segmentImage: "Female"), Segment(id: 2, segmentName: "Trans", segmentImage: "Transgender")])
    }
}
