//
//  FlightInfoModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 16.03.2024.
//

import Foundation


struct FlightInfoModel: Codable, Identifiable, Hashable {
    var objectId: String? {
        return id
    }
    var fairings: Fairings?
    var links: Links?
    var net: Bool?
    var window: Int?
    var rocket: String?
    var success: Bool?
    var launchpad: String?
    var flightNumber: Int?
    var name, dateUTC: String?
    var dateUnix: Int?
    var dateLocal: String?
    var datePrecision: String?
    var upcoming: Bool?
    var cores: [Core?]
    var autoUpdate, tbd: Bool?
    var id: String
    
    enum CodingKeys: String, CodingKey {
          case fairings, links
          case net, window, rocket, success, launchpad
          case flightNumber = "flight_number"
          case name
          case dateUTC = "date_utc"
          case dateUnix = "date_unix"
          case dateLocal = "date_local"
          case datePrecision = "date_precision"
          case upcoming, cores
          case autoUpdate = "auto_update"
          case tbd
          case id
      }
}

struct Fairings: Codable, Hashable {
    var reused, recoveryAttempt, recovered: Bool?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
    }
}

// MARK: - Links
struct Links: Codable, Hashable {
    var patch: Patch?
    var webcast: String?
    var youtubeID: String?
    var article: String?
    var wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
        case patch
    }
}

struct Patch: Codable, Hashable {
    var small, large: String?
}
// MARK: - Core
struct Core: Codable, Hashable {
    var core: String?
    var flight: Int?
    var gridfins, legs, reused, landingAttempt: Bool?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
    }
}
