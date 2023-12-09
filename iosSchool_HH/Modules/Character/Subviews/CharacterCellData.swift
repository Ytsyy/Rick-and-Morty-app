//
//  CharacterCellData.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import Foundation
import UIKit

struct CharactersCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?


    let isLoading: Bool
    let url: String
    let name: String?
    let imageUrl: String?
    let image: UIImage?

    init(character: Character, isLoading: Bool, image:UIImagge?, selectClosure: ((CoreCellInputData) -> Void)?) {
        
    }

    init(url: String){
        self.url = url
        isLoading = true
        name = nil
        imageUrl = nil
        image = nil
    }
}
