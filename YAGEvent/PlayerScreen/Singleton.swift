//
//  Singleton.swift
//  YAGEvent
//
//  Created by Никита on 26.01.2022.
//

import UIKit

class Singleton {
    
    static var shared: Singleton = {
        let instance = Singleton()
        
        return instance
    }()
    
    static var deadlite = Player()
    static var blame = Player()
    static var number5 = Player()
    static var vizo = Player()
    static var zoidberg = Player()
    var buildings = [BuildingsList.Building1.description, BuildingsList.Building2.description, BuildingsList.Building3.description, BuildingsList.Building4.description, BuildingsList.Building5.description, BuildingsList.Building6.description, BuildingsList.Building7.description, BuildingsList.Building8.description, BuildingsList.Building9.description, BuildingsList.Building10.description, BuildingsList.Building11.description, BuildingsList.Building12.description, BuildingsList.Building13.description]
    var players = ["DeadLite" : deadlite, "Blame" : blame, "Number5" : number5, "Vizo" : vizo, "Zoidberg" : zoidberg]
    private init() {}
    
}

extension Singleton: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
