//
//  LaunchesViewModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation

protocol LaunchesViewModelProtocol {
    func fetchLaunches()
    func sortLaunchesByDate()
}

class LaunchesViewModel: LaunchesViewModelProtocol, ObservableObject {
    
    fileprivate var launchesService: NetworkServiceProtocol? = NetworkService()
    
    public var didSuccess: ()->() = {}
    public var didFailure: (String)->() = { _ in }
    
    @Published var launches: [FlightInfoModel] = []
    
    init() {}
    
    func fetchLaunches() {
        launchesService?.getLaunches(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.launches = model
                self.didSuccess()
            case .failure(let error):
                self.didFailure(error.localizedDescription)
            }
        })
    }
    
    func sortLaunchesByDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        launches.sort { (launch1, launch2) in
            guard let date1String = launch1.dateLocal,
                  let date2String = launch2.dateLocal else {
               
                return false
            }
            
            guard let date1 = dateFormatter.date(from: date1String),
                  let date2 = dateFormatter.date(from: date2String) else {
            
                return false
            }
            
            return date1 > date2
        }
        
    }
}
