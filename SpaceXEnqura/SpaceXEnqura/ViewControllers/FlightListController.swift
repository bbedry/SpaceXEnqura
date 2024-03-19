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
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    @State private var selectedFlight: FlightInfoModel? = nil

    var body: some View {
           NavigationView {
               if isLoading {
                   CircleProgressView(progress: $progress)
                       .frame(width: 64, height: 64)
               } else {
                   List(launchVM.launches) { flightInfo in
                       NavigationLink(destination: FlightDetailsController(flightInfo: flightInfo)) {
                           FlightListItemView(flightInfo: flightInfo)
                       }
                       .onAppear(perform: {
                           self.selectedFlight = flightInfo
                       })
    
                   }
                   .navigationTitle("Launches")
               }
             
           }.onAppear {
               isLoading = true
               
               withAnimation(.linear(duration: 5.0)) {
                   self.progress = 0.1
               }
               
               DispatchQueue.main.async {
                   self.launchVM.fetchLaunches()
                   self.launchVM.didSuccess = {
                       self.launchVM.sortLaunchesByDate()
                       isLoading = false
                   }
        
               }
              
           }
       }
    }


struct FlightListController_Previews: PreviewProvider {
    static var previews: some View {
        FlightListController()
    }
}

struct FlightListItemView: View {
    let flightInfo: FlightInfoModel

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
