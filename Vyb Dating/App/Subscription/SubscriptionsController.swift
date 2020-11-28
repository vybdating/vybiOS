//
//  SubscriptionsController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 28/11/2020.
//

import SwiftUI

struct SubscriptionsController: View {
    
    //MARK: PROPERTIES
    @ObservedObject var viewModel = SubscriptionViewModel()
    @State var currentSubcription = SubscriptionItem()
   
    init() {
           UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
          
           //UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
       }
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.allPlans, id: \.id) { item in
                    SubcriptionItemView(subscriptionItem: item)
                        .onTapGesture { self.didSelectItem(item) }
                        .modifier(RowModifier())
                        .animation(.linear(duration: 0.3))
                }
                //: LIST
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .lineSpacing(8.0)
                .padding(.leading, -16)
                .padding(.trailing, -16)
                
                Spacer()
                
                DefaultButton(title: "Continue", disabled: false, action:{
                    
                }).padding(16)
                //MARK: continue with subscrition
                
                    
            }
            //: VSTACK
            .background(Color.vybBackground)
            .navigationTitle(Text("Subscribe"))
            .navigationBarTitle(Text("Subscribe"), displayMode: .inline)
        }
        //: NAVIGATION VIEW
    }
    
    //MARK: item selected
    private func didSelectItem(_ item: SubscriptionItem) {
        print("\(item.amountPerMonth)")
        self.currentSubcription = item
    }
}

struct SubscriptionsController_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsController()
    }
}
