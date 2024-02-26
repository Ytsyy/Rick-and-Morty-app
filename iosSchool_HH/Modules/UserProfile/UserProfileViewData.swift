//
//  UserProfileViewData.swift
//  iosSchool_HH
//
//  Created by Maxim on 26.02.2024.
//

import Foundation

import UIKit

struct ProfileViewData {
    let photoCellData: UserProfilePhotoCellData
    let loginCellData: UserProfileLoginCellData
    let infoCells: [UserProfileInfoCellData]
    let buttonCellData: UserProfileButtonCellData

    init(
        smallAvatarImg: UIImage?,
        largeAvatarImg: UIImage?,
        profile: Profile?,
        infoCells: [UserProfileInfoCellData],
        selectExit: ((CoreCellInputData) -> Void)?
    ) {
        self.photoCellData = UserProfilePhotoCellData(smallAvatarImg: smallAvatarImg, largeAvatarImg: largeAvatarImg)
        self.loginCellData = UserProfileLoginCellData(login: profile?.username)
        self.infoCells = infoCells
        self.buttonCellData = UserProfileButtonCellData(selectClosure: selectExit)
    }
}
