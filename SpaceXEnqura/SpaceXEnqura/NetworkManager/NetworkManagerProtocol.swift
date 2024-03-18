//
//  NetworkManagerProtocol.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation


protocol NetworkServiceProtocol {
    func getLaunches(completionHandler: @escaping ResultHandler<FlightInfoModel>)
}

struct NetworkService: NetworkServiceProtocol {
    func getLaunches(completionHandler: @escaping ResultHandler<FlightInfoModel>) {
        let finalRequest = PrepareNetworkRequest.getFeed(())
        NetworkManager.shared.request(finalRequest, decodeToType: [FlightInfoModel].self, completionHandler: completionHandler)
    }
    
    
}
