//
//  UserProfileUsernameCellData.swift
//  iosSchool_HH
//
//  Created by Maxim on 21.02.2024.
//

import UIKit

struct UserProfileUsernameCellData: CoreCellInputData {
    let username: String
    var selectClosure: ((CoreCellInputData) -> Void)?
}
