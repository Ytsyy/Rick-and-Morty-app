//
//  BaseTextField.swift
//  iosSchool_HH
//
//  Created by student on 25.12.2023.
//

import UIKit

class BaseTextField: UITextField {

    init() {
        super.init(frame: .zero)
        setupDefaultSettings()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefaultSettings()
    }

    private func setupDefaultSettings() {
        textColor = UIColor(named: "GrayForTextField")
        clipsToBounds = true
        borderStyle = .none
        layer.backgroundColor = UIColor(.white).cgColor
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(.black).cgColor

        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
