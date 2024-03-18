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
//            List(launchVM.launches) { launch in
//                VStack(alignment: .leading) {
//                    if let imageData = launch.links?.article {
//                        KFImage(URL(string: imageData))
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 24, height: 24)
////                            .aspectRatio(contentMode: .fit)
////                        Image(uiImage: image)
////                            .resizable()
////                            .aspectRatio(contentMode: .fit)
////                            .frame(width: 24, height: 24)
//                    }
//                    Text(launch.name ?? "")
////                    Text(launch.name ?? "")
////                    Text(launch.dateUTC)
//                }
//            }
        }
        .onAppear {
            DispatchQueue.main.async {
                self.launchVM.fetchLaunches()
                self.launchVM.didSuccess = {
                    print("başarılı")
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
