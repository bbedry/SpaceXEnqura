//
//  LaunchesViewModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//

import Foundation

protocol LaunchesViewModelProtocol {
    func fetchLaunches()
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
}
