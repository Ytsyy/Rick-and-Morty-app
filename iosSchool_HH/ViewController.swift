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
        let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
        let resultReduce = arrayInt.reduce([0]) { partialResult, element in
            [(partialResult.first ?? 0) + element ]
        }
        let result = arrayInt.filter { elem in
            return elem % 2 == 0
            let result1 = arrayInt.filter { $0 % 2 == 0}
        }

        let characters = (0..<10).map { _ in CharacterGenerator().generateCharacter()}
        let maleCharacters = characters.filter { $0.gender == .male }

        let charactersWithAInName = characters.filter { $0.name.contains("a") || $0.name.contains("A") }

        let names = ["John", "Jim", "Jojo"]
        let charactersFromNames = names.map { name in
            let randomCharacter = CharacterGenerator().generateCharacter()
            return Character(
                id: randomCharacter.id,
                name: name,
                species: randomCharacter.species,
                image: randomCharacter.image,
                url: randomCharacter.url,
                episode: randomCharacter.episode,
                gender: randomCharacter.gender,
                status: randomCharacter.status
            )
        }

        let episodeNames = ["Episode 1", "Episode 2", "Episode 3"]
        let charactersForEpisodesUsingMap = episodeNames.map { _ in
            (1...3).map { _ in
                CharacterGenerator().generateCharacter()
            }
        }
        let charactersForEpisodesUsingCompactMap = episodeNames.compactMap { _ in
            (1...3).map { _ in
                CharacterGenerator().generateCharacter()
            }
        }

        let totalCharacterNames = characters.reduce("") { result, character in
            return result + character.name
        }

        generator.changeColor {
            [0, 100, 200]
        }
    }
}
