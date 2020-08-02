//
//  TrackerView.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import SwiftUI

struct TrackerView: View {
    @ObservedObject var covidVM: CovidViewModel
    
    let country: Country
    
    init(country:Country) {
        self.covidVM = CovidViewModel(city:country.name)
        self.country = country
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("\(country.name)").font(.system(size:24))
                Spacer()
            }
            Spacer()
            HStack{
                Text("New: \(self.covidVM.newCases)").font(.system(size:16))
            }.frame(maxWidth: .infinity).padding(16).background(Color.red).cornerRadius(8)
            Spacer()
            HStack{
                Text("Recovered: 10").font(.system(size:10)).padding().background(Color.green).cornerRadius(8)
                Spacer()
                Text("Active: 10").font(.system(size:10)).padding().background(Color.yellow).cornerRadius(8)
            }
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView(country:Country(name:"Malaysia"))
    }
}
