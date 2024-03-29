//
//  FlightDetailsController.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 16.03.2024.
//

import SwiftUI
import WebKit
import Kingfisher
import SafariServices

struct FlightDetailsController: View {
    
    var flightInfo: LaunchModel?
    
    @State private var isActive = false
    @State private var isSafariViewPresented = false
    @State private var safariURL: String?
    @State var showsAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
        
                if let videoId = flightInfo?.links?.youtubeID {
                    let viewModel = WebViewModel(youtubeId: videoId)
                    
                    WebViewContainer(webViewModel: viewModel)
                        .frame(height: 360)
                        .padding(.top, 20)
                        
                } else if let imageURL = flightInfo?.links?.patch?.small {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 360)
                        .aspectRatio(contentMode: .fill)
                        .padding(.top, 20)
                } else {
                    Text("No video or image available for this flight.")
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
            }
            .padding(.top, 20)
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16 ) {
                HStack {
                    Text("Launch Name:")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("\(flightInfo?.name ?? "No launch name")")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer(minLength: 16)
                }
                
                HStack {
                    Text("Flight Number:")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("\(flightInfo?.flightNumber ?? 0)")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Spacer(minLength: 16)
                }
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16) {
                if let details = flightInfo?.details, !details.isEmpty {
                    Text("About Launch")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.top)
                        .padding(.leading, 8)
                        .padding(.bottom, 8)
                    Text(details)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .frame(alignment: .center)
                }
                Spacer()
                
                VStack(alignment: .center) {
                    Button("Read on Safari") {
                    
                        if ((flightInfo?.links?.article) == nil) && flightInfo?.links?.wikipedia == nil {
                            self.showsAlert.toggle()
                        }
                        isSafariViewPresented = true
                    }
                   
                    .padding(.leading, 16)
                    .sheet(isPresented: $isSafariViewPresented) {
                        if let article = flightInfo?.links?.article, let url = URL(string: article) {
                            SafariView(url: url)
                            
                        } else if let wiki = flightInfo?.links?.wikipedia, let url = URL(string: wiki) {
                            SafariView(url: url)
                        }

                    }
                    .alert(isPresented: $showsAlert) {
                        Alert(title: Text("Error"), message: Text("No found Article or Wikipedia source."), dismissButton: .default(Text("OK")))
                    }
                } 
                .frame(maxWidth: .infinity)
               
            }
        }
        .navigationTitle("Launch Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FlightListDetailController_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailsController()
    }
}
