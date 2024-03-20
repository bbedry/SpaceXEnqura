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
    @State private var selectedFlight: LaunchModel? = nil
    @State private var showsAlert = false
    @State private var alertMessage = ""
    @State private var isFoundData = false
    
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
        }
       
        .alert(isPresented: $showsAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .overlay (
            Group {
                if isFoundData {
                    Text("Something went wrong...")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
            }
        )
        .onAppear {
            isLoading = true
            
            withAnimation(.linear(duration: 5.0)) {
                self.progress = 0.1
            }
            
            DispatchQueue.main.async {
                self.launchVM.fetchLaunches()
                self.launchVM.didSuccess = {
                    self.launchVM.sortLaunchesByDate()
                    isLoading = false
                    isFoundData = false
                }
                self.launchVM.didFailure = { error in
                    alertMessage = error
                    showsAlert = true
                    isLoading = false
                    isFoundData = true
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

