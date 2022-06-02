//
//  ContentView.swift
//  YAGEvent
//
//  Created by Miller Vladimir on 05.12.2021.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        TabView {
            PlayerController()
                .tabItem {
                    Text("Инфо")
                }
            
            
            MapTabView()
                .tabItem {
                    Text("Карта")
                }
            
            CurrentTurnTabView()
                .tabItem {
                    Text("Ход")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
