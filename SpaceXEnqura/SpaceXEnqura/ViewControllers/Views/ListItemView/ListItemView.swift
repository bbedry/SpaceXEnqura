//
//  ListItemView.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 20.03.2024.
//

import SwiftUI
import Kingfisher

struct ListItemView: View {
    let flightInfo: LaunchModel
    
    var body: some View {
        HStack(spacing: 10) {
            if let imageURL = flightInfo.links?.patch?.small,
               let url = URL(string: imageURL) {
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(5)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(5)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(flightInfo.name ?? "Unknown Name")
                    .font(.headline)
                Text(flightInfo.dateLocal?.convertDateWithoutTime() ?? "Unknown Date")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
