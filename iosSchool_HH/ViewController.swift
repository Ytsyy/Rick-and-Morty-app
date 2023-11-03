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

        generator.changeColorCodes { colorCodes in
            print(colorCodes)
        }
        generator.changeColor {
            [0,100,200]
        }
    }
}
