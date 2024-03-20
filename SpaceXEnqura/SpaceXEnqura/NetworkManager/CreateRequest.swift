//
//  CreateRequest.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation
import Alamofire

enum PrepareNetworkRequest: URLRequestConvertible {
  
    case getLaunches(Void)
    
    var baseURL: URL {
        return URL(string: "https://api.spacexdata.com/v4")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLaunches:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getLaunches:
            return "/launches"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = URLEncoding(arrayEncoding: .brackets)
        return try encoding.encode(urlRequest, with: [:])
        
    }
}
