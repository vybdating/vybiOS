//
//  CountryPickerController.swift
//  Vyb Dating
//
//  Created by Bright Ahedor on 21/11/2020.
//

import SwiftUI

struct CountryPickerView: View {
    //MARK: PROPERTIES
    @State var countries = [CountryItem]()
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText : String = ""
    let action: (CountryItem) -> Void
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                //MARK: search bar
                SearchBar(text: $searchText, placeholder: "Search country")
                //MARK: 
                List(countries.filter({ (countryItem) -> Bool in
                    self.searchText.isEmpty ? true : countryItem.name.lowercased().contains(self.searchText.lowercased())
                })) { country in
                    Button(action: {
                        print("PICKED \(country.name)")
                        self.action(country)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        CountryItemView(countryItem: country)
                    })
                 }
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel").foregroundColor(Color.primaryVybe)
                }))
                .navigationTitle("Countries")
                .navigationBarTitle(Text("Countries"), displayMode: .inline)
            }
        }.onAppear(){
            Locale.isoRegionCodes.forEach { (code) in
                let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])

                if let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) {
                    self.countries.append(CountryItem(id: id, name: name, code: code, imageName: code.uppercased().toEmoji()))
                }
            }
        }
    }
}

struct CountryItemView: View {
    //MARK: PROPERTIES
    var countryItem : CountryItem

    //MARK: BODY
    var body: some View {
        HStack {
            Text(countryItem.imageName)
                .frame(width: 30, height: 44, alignment: .leading)
            
            Text(countryItem.name)
                .font(.title3)
                .foregroundColor(.black)
        }
        .frame(height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipped()
    }
}

struct CountryPickerController_Previews: PreviewProvider {
    
    static var previews: some View {
        CountryPickerView { (item) in
            
        }
    }

}
