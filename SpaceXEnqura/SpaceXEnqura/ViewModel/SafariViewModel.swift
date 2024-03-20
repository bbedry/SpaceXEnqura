//
//  SafariViewModel.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 20.03.2024.
//


import SafariServices

class SafariViewModel: ObservableObject {
    @Published var url: String = ""

    private static let defaultURL = "http://www.google.com"

       var webView: SFSafariViewController {
           get {
               var vc: SFSafariViewController
               if let urlObj = URL(string: url), UIApplication.shared.canOpenURL(urlObj) {
                   vc = SFSafariViewController(url: urlObj)
               } else {
                   // If the given URL is invalid or empty, it uses the default URL
                   vc = SFSafariViewController(url: URL(string: SafariViewModel.defaultURL)!)
               }
               return vc
           }
       }
       
       init(url: String = "") {
           self.url = url.isEmpty ? SafariViewModel.defaultURL : url
       }

    /// Validate URL scheme
    /// - Parameter url: Source URL
    /// - Returns: TRUE - If the source URL scheme is HTTP or HTTPS
    static func isValidUrl(_ url: String) -> Bool {
        if url.validURL {
            return true
        } else {
            return false
        }
    }
    
    /// Get URL object
    /// - Parameter url: Source URL
    /// - Returns: An instance or URL object or nil
    static func validateUrl(_ url: String) -> URL? {
        if (isValidUrl(url)) {
            guard let urlObj = URL(string: url) else {
                return nil
            }
            
            return urlObj
        }
        
        return nil
    }
}
