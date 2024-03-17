//
//  FlightInfoModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 16.03.2024.
//

import Foundation


struct FlightInfoModelElement: Codable {
    var fairings: Fairings
    var links: Links
    var staticFireDateUTC: String
    var staticFireDateUnix: Int
    var net: Bool
    var window: Int
    var rocket: String
    var success: Bool
    var failures: [Failure]
    var details: String
//    var crew, ships, capsules: [JSONAny]
    var payloads: [String]
    var launchpad: String
    var flightNumber: Int
    var name, dateUTC: String
    var dateUnix: Int
    var dateLocal: Date
    var datePrecision: String
    var upcoming: Bool
    var cores: [Core]
    var autoUpdate, tbd: Bool
//    var launchLibraryID: JSONNull?
    var id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC
        case staticFireDateUnix
        case net, window, rocket, success, failures, details, payloads, launchpad
        case flightNumber
        case name
        case dateUTC
        case dateUnix
        case dateLocal
        case datePrecision
        case upcoming, cores
        case autoUpdate
        case tbd
//        case launchLibraryID
        case id
    }
}

struct Fairings: Codable {
    var reused, recoveryAttempt, recovered: Bool
//    var ships: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt
        case recovered
    }
}

// MARK: - Links
struct Links: Codable {
    var webcast: String
    var youtubeID: String
    var article: String
    var wikipedia: String

    enum CodingKeys: String, CodingKey {
        case webcast
        case youtubeID
        case article, wikipedia
    }
}

// MARK: - Core
struct Core: Codable {
    var core: String
    var flight: Int
    var gridfins, legs, reused, landingAttempt: Bool
//    var landingSuccess, landingType, landpad: JSONNull?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt
    }
}

// MARK: - Failure
struct Failure: Codable {
    var time: Int
//    var altitude: JSONNull?
    var reason: String
}
