//
//  CharactersViewController.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation
import UIKit

class CharacterViewController: UIViewController {

    private let dataProvider: CharacterDataProvider

    init(dataProvider: CharacterDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getCharacter()
    }

    func getCharacter() {
        dataProvider.getCharacter( id: Int.random(in: 1..<827)) { character, error in
            print(character ?? "No character")
            print(error?.rawValue ?? "No error")
        }
    }
}
