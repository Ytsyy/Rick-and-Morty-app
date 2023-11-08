//
//  ViewController.swift
//  iosSchool_HH
//
//  Created by student on 19.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let generator = ColorGenerator(alpha: 1)
        let result1 = arrayInt.filter { $0 % 2 == 0}
        let array = [0.1, 0.2, 0.5, 1]
        let generators = array.map { ColorGenerator(alpha: $0) }
        let test = array.map {alpha -> ColorGeneratorProtocol? in
            guard alpha < 1 else {
                return nil
            }
            return ColorGenerator(alpha: alpha)
        }
        let test1: [ColorGenerator?] = array.map {
            guard $0 < 1 else {
                return nil
            }
            return ColorGenerator(alpha: $0)
        }
        let test2 = test1.compactMap{ $0 }
        let test3 = test1.compactMap{ $0?.alpha }
        let test4 = test1.map { $0?.alpha }
        //let color = Color(red: 1, green: 1, blue:1)
        //let intArray = generator.convertToArray(element: 1)
        //let colorArr = generator.convertToArray(element: color)
        let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
        let resultReduce = arrayInt.reduce([0]) { partialResult, element in
            [(partialResult.first ?? 0) + element ]
        }
        let result = arrayInt.filter { elem in
            return elem % 2 == 0
                                     }
      
        let characterGenerator: CharacterGeneratorProtocol = CharacterGenerator()
        let characterGeneratorInstance = CharacterGenerator()
        let generatedCharacter1 = characterGenerator.generateCharacter()
        let generatedCharacter2 = characterGeneratorInstance.generateCharacter()

        let nameThreeHandler = CharacterGenerator().generateNameThree()
        let nameFourClosure = CharacterGenerator().generateNameFour()

        CharacterGenerator().generateNameOne { name in
            print("First generated name: \(name)")
        }

        print("Second generated name: ", terminator: "")
        CharacterGenerator().generateNameTwo {
            String(Int.random(in: 0...1000))
        }

        print("Third generated name: ", terminator: "")
        nameThreeHandler()

        print("Fourth generated name: \(nameFourClosure())")

        generator.changeColor {
            [0, 100, 200] 
    }
}
