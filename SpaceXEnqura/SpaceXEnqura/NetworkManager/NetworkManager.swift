//
//  NetworkManager.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation
import Alamofire


typealias ResultHandler<T: Codable> = (Result<[T], NetworkError>) -> Void

final class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    func request<T: Codable>(_ request: URLRequestConvertible,
                             decodeToType type: [T].Type,
                             completionHandler: @escaping ResultHandler<T>) {
        DispatchQueue.main.async {
            AF.request(request).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        
                        let decoder = JSONDecoder()
                        let result = try decoder.decode([T].self, from: data)
                        completionHandler(.success(result))
                        
                    } catch let error {
                        completionHandler(.failure(.decodeError(error)))
                    }
                case .failure(let error):
                    completionHandler(.failure(.networkError(error)))
                }
            }
            
        }
    }
}


enum NetworkError: Error {
    case networkError(Error)
    case decodeError(Error)
    
    var localizedDescription: String {
        switch self {
        case .networkError:
            return "The Internet connection appears to be offline."
        case .decodeError:
            return "Failed to retrieving launches data."
        }
    }
}
