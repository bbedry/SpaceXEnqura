//
//  NetworkManagerProtocol.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation


protocol NetworkServiceProtocol {
    func getLaunches(completionHandler: @escaping ResultHandler<LaunchModel>)
}

struct NetworkService: NetworkServiceProtocol {
    func getLaunches(completionHandler: @escaping ResultHandler<LaunchModel>) {
        let finalRequest = PrepareNetworkRequest.getLaunches(())
        NetworkManager.shared.request(finalRequest, decodeToType: [LaunchModel].self, completionHandler: completionHandler)
    }
    
    
}
