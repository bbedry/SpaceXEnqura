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

    var body: some View {
           NavigationView {
               if isLoading {
                   CircularProgressView(progress: $progress)
                       .frame(width: 64, height: 64)
               } else {
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
                               Text(flightInfo.dateLocal?.convertDateWithoutTime() ?? "Unknown Date")
                                   .font(.subheadline)
                                   .foregroundColor(.gray)
                           }
                       }
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



struct Post: Identifiable {
    let id: String
    let title: String
}



struct FlightListController_Previews: PreviewProvider {
    static var previews: some View {
        FlightListController()
    }
}

struct CircularProgressView: View {
    @Binding var progress: CGFloat // Binding ile progress değeri aktar
    
    var body: some View {
        ZStack {
            // Background for the progress bar
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.1)
                .foregroundColor(.blue)

            // Foreground or the actual progress bar
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}
