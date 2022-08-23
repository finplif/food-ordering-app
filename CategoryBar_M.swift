//
//  CategoryBar_M.swift
//  Gyros47
//
//  Created by finplif on 8/15/22.
//

import Foundation
import SwiftUI

enum CategoryBar_M: Int, CaseIterable {
    case Picked
    case ItalianBeef
    case Mains
    case FishDinner
    case FishCombo
    case Burgers
    case OriginalPhillySteak
    case SubmarineSandwiches
    case Salads
    case HotandPolish
    case MixandMatch
    case Sides
    case Gyro
    case Beverages
    
    var title: String {
        switch self {
        case .Picked: return "Picked Food"
        case .ItalianBeef: return "Italian Beef"
        case .Mains: return "Mains"
        case .FishDinner: return "Fish Dinner"
        case .FishCombo: return "Fish Combo"
        case .Burgers: return "Burgers"
        case .OriginalPhillySteak: return "Original Philly Steak"
        case .SubmarineSandwiches: return "Submarine Sandwiches"
        case .Salads: return "Salads"
        case .HotandPolish: return "Hot and Polish"
        case .MixandMatch: return "Mix and Match"
        case .Sides: return "Sides"
        case .Gyro: return "Gyro"
        case .Beverages: return "Beverages"
        }
    }
        
    var allfooditems: [AllFood_M] {
        switch self {
            case .Picked:
                return PickedFood
            case .ItalianBeef:
                return ItalianBeefFood
            case .Mains:
                return MainsFood
            case .FishDinner:
                return FishDinnerFood
            case .FishCombo:
                return FishComboFood
            case .Burgers:
                return BurgersFood
            case .OriginalPhillySteak:
                return OriginalPhillySteakFood
            case .SubmarineSandwiches:
                return SubmarineSandwichesFood
            case .Salads:
                return SaladsFood
            case .HotandPolish:
                return HotandPolishFood
            case .MixandMatch:
                return MixandMatchFood
            case .Sides:
                return SidesFood
            case .Gyro:
                return GyroFood
            case .Beverages:
                return BeveragesFood
        }
    }
}
