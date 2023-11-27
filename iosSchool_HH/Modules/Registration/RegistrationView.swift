//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    func setView()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var backgroundImageView: UIImageView!
        @IBOutlet private var labelView: UIView!
        @IBOutlet private var iconImageView: UIImageView!
        @IBOutlet private var loginTextField: UITextField!
        @IBOutlet private var passwordTextField: UITextField!
        @IBOutlet private var repeatPasswordTextField: UITextField!
        @IBOutlet private var registrationButton: UIButton!
        @IBOutlet private var backButton: UIButton!

    func setView(){

        backgroundImageView.image = UIImage(named: "BackgroundRegistration")

        iconImageView.image = UIImage(named: "IconDog")
    }
}
