//
//  UserProfileViewData.swift
//  iosSchool_HH
//
//  Created by Maxim on 26.02.2024.
//

import UIKit

struct UserProfileViewData {
    let photoCellData: UserProfilePhotoCellData
    let usernameCellData: UserProfileUsernameCellData
    let dateColorCellData: [UserProfileDateColorCellData]
    let logoutCellData: UserProfileLogoutCellData

    init(
        image: UIImage?,
        username: String,
        date: String,
        color: UIColor,
        logoutClosure: @escaping (CoreCellInputData) -> Void
    ) {
        photoCellData = UserProfilePhotoCellData(image: image)
        usernameCellData = UserProfileUsernameCellData(username: username)
        dateColorCellData = [
            UserProfileDateColorCellData(date: date, color: nil),
            UserProfileDateColorCellData(date: nil, color: color)
        ]
        logoutCellData = UserProfileLogoutCellData(selectClosure: logoutClosure)
    }
}
