//
//  ActivityIndicator.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SwiftUI

struct ActivityIndicator: View {
    let style: UIActivityIndicatorView.Style
    var color: UIColor?
    
    var body: some View {
        VStack {
            if #available(iOS 14.0, *) {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.gray))
            } else {
                ActivityIndicatorRepresentable(style: style, color: color)
            }
        }
    }
}

struct ActivityIndicatorRepresentable: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    var color: UIColor?
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        activityIndicatorView.color = color
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
