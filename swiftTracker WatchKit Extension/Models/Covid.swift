//
//  Covid.swift
//  swiftTracker WatchKit Extension
//
//  Created by ho.wai.loon on 01/08/2020.
//  Copyright © 2020 ho.wai.loon. All rights reserved.
//

import Foundation

struct CovidResponse: Codable {
    //    var testedPositive: intmax_t?
    //    var latest: Covid
    //    var history: Array<Covid>
    //    var testedPositive, recovered, activeCases, deceased: Int?
    //    var lastUpdatedAtSource: String?
    var testedPositive: Deceased?
    var lastUpdatedAtApify: String?
//    init(_ dictionary: [String: Any]) {
//        self.testedPositive = dictionary["testedPositive"] as? Int ?? 0
//        self.testedPositive = dictionary["testedPositive"] as? String ?? ""
//        self.lastUpdatedAtApify = dictionary["lastUpdatedAtApify"] as? String ?? ""
//        self.respiratoryAid = dictionary["respiratoryAid"] as? Int ?? 0
//    }
}

enum Deceased: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Deceased.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Deceased"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

//struct User {
//    var userId: Int
//    var id: Int
//    var title: String
//    var completed: Bool
//    init(_ dictionary: [String: Any]) {
//        self.userId = dictionary["userId"] as? Int ?? 0
//        self.id = dictionary["id"] as? Int ?? 0
//        self.title = dictionary["title"] as? String ?? ""
//        self.completed = dictionary["completed"] as? Bool ?? false
//    }
//}

struct CovidResponseLatest: Decodable {
    var testedPositive, recovered, activeCases, deceased: Int?
    var lastUpdatedAtSource: String?
}

struct Covid: Decodable {
    var testedPositive: intmax_t?
    //    var activeCases: intmax_t?
    //    var recovered: intmax_t
}
