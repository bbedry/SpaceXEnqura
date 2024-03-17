//
//  FlightListController.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 16.03.2024.
//

import SwiftUI

struct FlightListController: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
            .navigationTitle("Launches")
        }
    }
}



struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Deneme"),
    Post(id: "2", title: "Bedri"),
    Post(id: "3", title: "Ritsa")
]


#Preview {
    FlightListController()
}
