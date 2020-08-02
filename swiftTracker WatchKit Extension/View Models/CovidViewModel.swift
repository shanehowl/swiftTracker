//
//  CovidViewModel.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import Foundation

class CovidViewModel: ObservableObject {
    @Published var covid = CovidResponseLatest()
    init(city:String){
        fetchLatestResult(city:city)
    }
    
    var newCases: String {
        if let testedPositive = self.covid.testedPositive {
            return String(testedPositive)
        } else {
            return "Empty"
        }
    }
    
    func fetchLatestResult(city:String){
        CovidService().getStatisticsByCountry(city:city){
            result in
            if let covid = result{
                DispatchQueue.main.async {
                    self.covid = covid
                }
            }
        }
    }
}
