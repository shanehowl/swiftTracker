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
    @Published var covidFull = [CovidResponse]()
//    @Published var covidFull = CovidResponse()
    init(city:String){
        fetchLatestResult(city:city)
//        fetchFullResult(city:city)
        fetchFullResult(city: city)
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
    
//    func fetchFullResult(city:String){
//        CovidService().getFullStatisticsByCountry(city: city) {
//            result in
//            if let covidFull = result{
//                DispatchQueue.main.async {
//                    self.covidFull = covidFull
//                }
//            }
//        }
//    }
    
    //* Get data from current day - 1 & compare with latest day to get the new case
    func fetchFullResult(city:String){
        CovidService().getFullStatisticsByCountry(city: city){
            result in
            if let response = result{
                DispatchQueue.main.async {
                    self.covidFull = response
                }
            }
        }
    }
}
