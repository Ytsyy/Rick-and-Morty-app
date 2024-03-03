//
//  CustomTextField.swift
//  iosSchool_HH
//
//  Created by Maxim on 01.03.2024.
//

import UIKit

final class CustomTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()

        borderStyle = .none
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "black")?.cgColor
        layer.cornerRadius = 15
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
