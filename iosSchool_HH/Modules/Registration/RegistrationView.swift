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

        isUserInteractionEnabled = true

        backgroundImageView.contentMode = .scaleAspectFill

        iconImageView.contentMode = .scaleAspectFill

        registrationTextFieldSettings(textField: loginTextField)
        registratinViewShadowSettings(loginTextField)
        loginTextField.setLeftPaddingInTextfield(padding: 16)

        registrationTextFieldSettings(textField: passwordTextField)
        registratinViewShadowSettings(passwordTextField)
        passwordTextField.setLeftPaddingInTextfield(padding: 16)

        registrationTextFieldSettings(textField: repeatPasswordTextField)
        registratinViewShadowSettings(repeatPasswordTextField)
        repeatPasswordTextField.setLeftPaddingInTextfield(padding: 16)

        registrationButtonSettings(button: registrationButton)
        registratinViewShadowSettings(registrationButton)

        registrationButtonSettings(button: backButton)
        registratinViewShadowSettings(backButton)
    }

    func registrationTextFieldSettings(textField: UITextField){
        textField.textColor = UIColor(red: 0.32, green: 0.31, blue: 0.31, alpha: 1)
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(.white).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }

    func registrationButtonSettings(button: UIButton) {
        button.titleLabel?.textColor = UIColor(.white)

        button.backgroundColor = UIColor(named: "iceColor")
        button.layer.cornerRadius = 10
    }

    func registratinViewShadowSettings<T: UIView>(_ view: T) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}

extension UITextField{
    func setLeftPaddingInTextfield(padding: Double){
        let leftView =  UIView()
        leftView.frame = CGRect.init(x: 0.0, y: 0.0, width: padding, height: self.frame.size.height)
        self.leftView = leftView
        self.leftViewMode = .always
    }
}
