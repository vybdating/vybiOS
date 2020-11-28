//
//  SubcriptionItemView.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

struct SubcriptionItemView: View {
    //MARK: PROPERTIES
    var subscriptionItem = SubscriptionItem()
    
    //MARK: BODY
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 2)
            HStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text(subscriptionItem.title)
                        .font(Font.robotoRegular(size: 24))
                        .foregroundColor(Color.primaryVybe)
                    
                    Text(subscriptionItem.message)
                        .font(Font.robotoThin(size: 14))
                }
                Spacer()
                VStack {
                    HStack(alignment: .center, spacing: 0){
                        
                        Text("\(subscriptionItem.currency)")
                            .font(Font.robotoThin(size: 14))
                            .foregroundColor(Color.primaryVybe)
                            .offset(x: 0, y: -5)
                            
                        
                        Text("\(subscriptionItem.amountPerMonth)")
                            .font(Font.robotoRegular(size: 20))
                            .foregroundColor(Color.primaryVybe)
                            .padding(0)
                        
                        Text("/mo")
                            .font(Font.robotoThin(size: 12))
                            .foregroundColor(Color.primaryVybe)
                    }
                    //: HSTACK
                }
                //: VSTACK
            }//: HSTACK
            .padding(16)
            
        }
        //: ZSTACK
    }
}

struct SubcriptionItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubcriptionItemView().previewLayout(.sizeThatFits)
    }
}
