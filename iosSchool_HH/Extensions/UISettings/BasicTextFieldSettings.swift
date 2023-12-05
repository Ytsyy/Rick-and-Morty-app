//
//  BasicTextFieldSettings.swift
//  iosSchool_HH
//
//  Created by student on 04.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func implementBasicTextFieldSettings(textField: UITextField) {
        textField.textColor = UIColor(named: "GrayForTextField")
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(.white).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(.black).cgColor
    }
}
