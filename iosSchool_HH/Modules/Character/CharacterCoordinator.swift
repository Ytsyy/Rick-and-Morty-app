//
//  CharactersCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

import UIKit

class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {
    struct Context {
    }

    override func make() -> UIViewController? {
        assembly.characterVC()
    }
}
