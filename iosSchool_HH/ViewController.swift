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

        let characterGenerator: CharacterGeneratorProtocol = CharacterGenerator()
        let characterGeneratorInstance = CharacterGenerator()
        let generatedCharacter1 = characterGenerator.generateCharacter()
        let generatedCharacter2 = characterGeneratorInstance.generateCharacter()

        let nameCharacterGenerator = CharacterGenerator()
        let generateNameTwoClosure: () -> String = {
            return String(Int.random(in: 0...1000))
        }
        let nameThreeHandler = nameCharacterGenerator.generateNameThree()
        let nameFourClosure = nameCharacterGenerator.generateNameFour()
        let nameFour = nameFourClosure()

        nameCharacterGenerator.generateNameOne { name in
            print("First generated name: \(name)")
        }

        print("Second generated name: ", terminator: "")
        nameCharacterGenerator.generateNameTwo(completion: generateNameTwoClosure)

        print("Third generated name: ", terminator: "")
        nameThreeHandler()

        print("Fourth generated name: \(nameFour)")

        generator.changeColor {
            [0, 100, 200]
        }
    }
}
