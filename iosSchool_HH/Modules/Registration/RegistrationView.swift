//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    var delegate: RegistrationViewDelegate? { get set }

    func setView()
}

protocol RegistrationViewDelegate: AnyObject {
    func registrationButtonDidTap(login: String, password: String, repeatPassword: String)
    func backButtonDidTap()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var registrationButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    weak var delegate: RegistrationViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(viewDidTap)
        )
        addGestureRecognizer(recognizer)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )

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

    func registrationTextFieldSettings(textField: UITextField) {
        textField.textColor = UIColor(red: 0.32, green: 0.31, blue: 0.31, alpha: 1)
        textField.clipsToBounds = true
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(.white).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }

    func registrationButtonSettings(button: UIButton) {
        button.layer.cornerRadius = 10
    }

    func registratinViewShadowSettings<T: UIView>(_ view: T) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    // MARK: - Private

    @IBAction
    private func registrationDidTap(sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()

        delegate?.registrationButtonDidTap(
        login: loginTextField.text ?? "",
        password: passwordTextField.text ?? "",
        repeatPassword: repeatPasswordTextField.text ?? ""
        )
    }

    @IBAction
    private func backDidTap(sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
        delegate?.backButtonDidTap()
    }

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc
    private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc
    private func viewDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
}
