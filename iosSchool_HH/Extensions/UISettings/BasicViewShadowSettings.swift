//
//  BasicViewShadowSettings.swift
//  iosSchool_HH
//
//  Created by student on 04.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func implementBasicViewShadowSettings<T: UIView>(_ view: T) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
