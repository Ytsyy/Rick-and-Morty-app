//
//  UITextField+LeftPadding.swift
//  iosSchool_HH
//
//  Created by MaximM on 29.11.2023.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingInTextfield(padding: Double) {
        let leftView =  UIView()
        leftView.frame = CGRect.init(x: 0.0, y: 0.0, width: padding, height: self.frame.size.height)
        self.leftView = leftView
        self.leftViewMode = .always
    }
}
