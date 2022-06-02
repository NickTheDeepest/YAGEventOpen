//
//  PlayerControllerTab.swift
//  YAGEvent
//
//  Created by Никита on 28.12.2021.
//

import SwiftUI

struct PlayerController : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlayerController>) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "PlayerScreenView", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "PlayerScreenHome")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PlayerController>) {
        
    }
}
