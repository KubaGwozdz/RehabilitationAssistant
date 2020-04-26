//
//  CameraView.swift
//  RehabilitationAssistant
//
//  Created by Jakub Gwóźdź on 23/04/2020.
//  Copyright © 2020 Jakub Gwóźdź. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraView : UIViewControllerRepresentable {
    let controller = VisionController()
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
//        let controller = VisionController()

        return controller
    }
    
    func updateUIViewController(_ uiViewController: CameraView.UIViewControllerType, context: UIViewControllerRepresentableContext<CameraView>) {
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraView()
//    }
//}
