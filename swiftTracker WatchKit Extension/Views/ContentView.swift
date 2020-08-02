//
//  ContentView.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let currentCountry: Country = Country(name:"Malaysia")
    var body: some View {
        TrackerView(country:currentCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
