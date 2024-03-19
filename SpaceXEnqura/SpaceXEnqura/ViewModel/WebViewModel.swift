//
//  WebViewModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 19.03.2024.
//

import Foundation

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""

    var youtubeId: String

    init(youtubeId: String) {
        self.youtubeId = youtubeId
    }
}
