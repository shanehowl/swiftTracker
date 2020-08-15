//
//  covidService.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import Foundation

class CovidService {
    func getStatisticsByCountry(city:String, completion:@escaping(CovidResponseLatest?) -> ()){
        // TODO
        // Creating the URL with the API we want to call
        // Create & start networking task to call the API
        // Handle the result return from API
        let apiURL = "https://api.apify.com/v2/key-value-stores/6t65lJVfs3d8s6aKc/records/LATEST?disableRedirect=true"
        
        guard let url = URL(string:apiURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let covidResponse = try? JSONDecoder().decode(CovidResponseLatest.self, from:data)
            if let covidResponse = covidResponse {
                let covid = covidResponse
                completion(covid)
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func getFullStatisticsByCountry(city:String, completion:@escaping([CovidResponse]?) -> ()){
        let apiURL = "https://api.apify.com/v2/datasets/7Fdb90FMDLZir2ROo/items?format=json&clean=1"
        
        guard let url = URL(string:apiURL) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with:url){data,response,error in
            guard let dataResponse = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let response = try? JSONDecoder().decode([CovidResponse].self, from: dataResponse)
            if let covidResponse = response {
                let fullCovidStatistics = covidResponse
                completion(fullCovidStatistics)
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func temp() {
        guard let url = URL(string: "https://api.apify.com/v2/datasets/7Fdb90FMDLZir2ROo/items?format=json&clean=1") else { return }
        let task = URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
//                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
//                guard let jsonArray = jsonResponse as? [[String:Any]] else {
//                    return
//                }
//                var model = [CovidResponse]() //Initialising Model Array
//                model = jsonArray.compactMap{CovidResponse($0)}
                //                for dic in jsonArray{
                //                    model.append(CovidResponse(dic))
                //                    print(dic)
                ////                    guard let testedPositive = dic["testedPositive"] as? Int else {
                ////                        print("noResult")
                ////                        return
                ////                    }
                ////                    print(testedPositive)
                //
                //                }
//                print("this is the response",model)
                let decoder = JSONDecoder()
                let t_model = try decoder.decode([CovidResponse].self, from: dataResponse)
                print("from decoder",t_model)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
