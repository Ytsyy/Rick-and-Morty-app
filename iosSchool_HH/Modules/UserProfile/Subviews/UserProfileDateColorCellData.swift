//
//  UserProfileDateColorCellData.swift
//  iosSchool_HH
//
//  Created by Maxim on 21.02.2024.
//

import UIKit

struct UserProfileDateColorCellData: CoreCellInputData {
    let date: String?
    let color: UIColor?

    var selectClosure: ((CoreCellInputData) -> Void)?
}
