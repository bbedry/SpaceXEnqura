//
//  FlightListController.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 16.03.2024.
//

import SwiftUI
import Kingfisher

struct FlightListController: View {
    
    @ObservedObject var launchVM =  LaunchesViewModel()
    //    @State private var launches: [FlightInfoModel] = []
    
    var body: some View {
           NavigationView {
               List(launchVM.launches) { flightInfo in
                   HStack(spacing: 10) {
                       if let imageURL = flightInfo.links?.patch?.small,
                          let url = URL(string: imageURL) {
                           KFImage(url)
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 50, height: 50)
                               .padding(5)
                       } else {
                           Image(systemName: "photo") // Varsayılan görsel
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 50, height: 50)
                               .padding(5)
                       }
                       
                       VStack(alignment: .leading, spacing: 5) {
                           Text(flightInfo.name ?? "Unknown Name")
                               .font(.headline)
                           Text(flightInfo.dateLocal ?? "Unknown Date")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                       }
                   }
               }
               .navigationTitle("Launches")
           }.onAppear {
               DispatchQueue.main.async {
                   self.launchVM.fetchLaunches()
                   self.launchVM.didSuccess = {
                       self.launchVM.sortLaunchesByDate()
                   }
        
               }
              
           }
       }
    }



struct Post: Identifiable {
    let id: String
    let title: String
}



struct FlightListController_Previews: PreviewProvider {
    static var previews: some View {
        FlightListController()
    }
}
