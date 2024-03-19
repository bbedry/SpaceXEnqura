//
//  CircleProgressView.swift
//  SpaceXEnqura
//
//  Created by Bedri Doğan on 19.03.2024.
//

import SwiftUI


struct CircleProgressView: View {
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.1)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}
