//
//  BuildingsList.swift
//  YAGEvent
//
//  Created by Никита on 09.03.2022.
//

import Foundation

enum BuildingsList {
    case Building1
    case Building2
    case Building3
    case Building4
    case Building5
    case Building6
    case Building7
    case Building8
    case Building9
    case Building10
    case Building11
    case Building12
    case Building13

    var description: [String] {
        switch self {
        case .Building1:
            return ["1", "Odin", "Здание один умеет делать бум-бам"]
        case .Building2:
            return ["2", "Dva", "Здание dva умеет делать"]
        case .Building3:
            return ["3", "Tree", "Здание three умеет делать"]
        case .Building4:
            return ["4", "Chetyre", "Здание 4 умеет делать"]
        case .Building5:
            return ["5", "Pyat", "abajsbdjbdjabj"]
        case .Building6:
            return ["6", "Shest", "Abobobobbobobo jnakbf babfasbfj afb,asbf,nabf af bf,nabnf 6"]
        case .Building7:
            return ["7", "Sem", "7"]
        case .Building8:
            return ["8", "Vosem", "888888888888888888"]
        case .Building9:
            return ["9", "Devyat", "9 9 9 9  9 9 9 9 9  9 9"]
        case .Building10:
            return ["10", "Desyat", "Desyat"]
        case .Building11:
            return ["11", "Odinnadcat", "+++++++++++ _----- ++++ 11"]
        case .Building12:
            return ["12", "Dvenadcat", "12"]
        case .Building13:
            return ["13", "Treenadcat", "OdinTree"]
        }
    }
}
