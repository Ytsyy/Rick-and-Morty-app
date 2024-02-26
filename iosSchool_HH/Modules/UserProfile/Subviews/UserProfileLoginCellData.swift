//
//  UserProfileLoginCellData.swift
//  iosSchool_HH
//
//  Created by Maxim on 26.02.2024.
//


import Foundation

struct UserProfileLoginCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let login: String
    init(login: String?) {
        self.login = login ?? ""
    }
}
