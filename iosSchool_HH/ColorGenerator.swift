//
//  ColorGenerator.swift
//  iosSchool_HH
//
//  Created by student on 23.10.2023.
//

import Foundation


struct Color{
    var alpha: Brightness
    let red: Double
    let green: Double
    let blue: Double
    
    func description(){
        print("R: \(red), aplha \(alpha.rawValue)")
    }
    init(red: Double, green: Double, blue: Double) {
        self.alpha = .din
        self.red = red
        self.green = green
        self.blue = blue
    }
}
class ColorGenerator{
    var alpha: Double
    let colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    
    init(alpha: Double) {
        self.alpha = alpha
    }
    
}

enum Brightness: Double {
    case din = 0.1
    case average = 0.5
    case bright = 1
    
    func description() -> String{
        switch self {
        case .din:
            return "Тусклый"
        case .average:
            return "Средний"
        case .bright:
            return "Яркий"
        }
    }
}
