//
//  SafariView.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 20.03.2024.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    var vm: SafariViewModel
    init(vm: SafariViewModel) {
        self.vm = vm
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return vm.webView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
