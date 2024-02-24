//
//  UserProfilePhotoCellData.swift
//  iosSchool_HH
//
//  Created by Maxim on 21.02.2024.
//

import UIKit

struct UserProfilePhotoCellData: CoreCellInputData {
    let image: UIImage
    var selectClosure: ((CoreCellInputData) -> Void)?

    init(image: UIImage?) {
        self.image = image ?? UIImage()
    }
}
