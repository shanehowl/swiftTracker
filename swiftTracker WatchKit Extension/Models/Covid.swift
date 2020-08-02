//
//  Covid.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import Foundation

struct CovidResponse: Decodable {
    //    var testedPositive: intmax_t?
    var latest: Covid
    var history: Array<Covid>
}

struct CovidResponseLatest: Decodable {
    var testedPositive, recovered, activeCases, deceased: Int?
    var lastUpdatedAtSource: String?
}

struct Covid: Decodable {
    var testedPositive: intmax_t?
    //    var activeCases: intmax_t?
    //    var recovered: intmax_t
}
