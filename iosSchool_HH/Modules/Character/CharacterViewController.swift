//
//  CharactersViewController.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation
import UIKit

class CharacterViewController: UIViewController {
    private var characters: [Character] = []

    private let dataProvider: CharacterDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageService: ImageServicesImp

    init(dataProvider: CharacterDataProvider, data: LocationCellData, imageService: ImageServicesImp) {
        self.dataProvider = dataProvider
        charactersUrlList = data.residents
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        charactersUrlList.forEach { url in
            requestCharacter(url: url) { [ weak self] character in
                print(character.name)
                self?.imageService.getImage(url: character.image, completion: { [weak self]
                    image in
                    print(image?.size ?? 0)
                })
            }
        }
}

    /// MARK: - Private func
       private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: {$0.url == url}) {
            completion(character)
            return
        }
        DispatchQueue.global().async{
            self.dataProvider.character(url: url) { [weak self] character, error in
                guard let character else {
                    print(error ?? "no error")
                    return
                }
                self?.updateQueue.async {
                    self?.characters.append(character)
                    completion(character)
                }
            }
        }
    }
}
