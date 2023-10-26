//
//  ColorGenerator.swift
//  iosSchool_HH
//
//  Created by student on 23.10.2023.
//

import Foundation
import UIKit


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


protocol ColorGeneratorProtoccol{
    var alpha: Double {get set}
    var colorCodes: [Double]{get}

    func createColor() -> UIColor

    init(alpha: Double)
}

/*extension ColorGeneratorProtoccol{
    func createCcolor()-> UIColor{
        return UIColor
    }
} */


class ColorGenerator: ColorGeneratorProtoccol{

    var alpha: Double
    var colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    let whiteColor: UIColor = .white

    required init(alpha: Double) {
        self.alpha = alpha
    }

    func createColor() -> UIColor {
        UIColor(white: 1, alpha: alpha)
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
