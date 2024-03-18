//
//  String.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 18.03.2024.
//

import Foundation

extension String {
    func convertDateWithoutTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
