//
//  UIImageView.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 17.03.2024.
//


import UIKit
import Kingfisher

extension UIImageView {
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: imageUrl) {
            self.kf.setImage(with: url)
        } else {
            self.image = UIImage(named: "place_holder")
        }
    }
}
