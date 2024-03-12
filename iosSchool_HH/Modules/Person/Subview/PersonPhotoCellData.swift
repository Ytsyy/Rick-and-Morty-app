//
//  PersonPhotoCellData.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

struct PersonPhotoCellData: CoreCellInputData {
    let image: UIImage

    var selectClosure: ((CoreCellInputData) -> Void)?
}
