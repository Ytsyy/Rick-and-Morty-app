//
//  UserProfileSizeCell.swift
//  iosSchool_HH
//
//  Created by Maxim on 21.02.2024.
//

import UIKit

struct UserProfileSizeCell {
    let screenSize: ScreenSize
    let textFieldCells: CGFloat = 116
    let label: CGFloat = 27
    let buttonBottomSpaceCell: CGFloat = 30
    let button: CGFloat = 40

    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    var spaces: CGFloat {
        UserProfileSizeCell.screenHeight -
        photoCell -
        label -
        textFieldCells -
        button -
        buttonBottomSpaceCell -
        tabBar
    }

    var fractionalPhotoCell: Double {
        switch screenSize {
        case .smallSize:
            return 0.53
        case .bigSize:
            return 0.47
        }
    }

    private var tabBar: CGFloat {
        switch screenSize {
        case .smallSize:
            return 49
        case .bigSize:
            return 137
        }
    }

    private var photoCell: CGFloat {
        UserProfileSizeCell.screenHeight * fractionalPhotoCell
    }

    enum ScreenSize {
        case smallSize
        case bigSize
    }
}
