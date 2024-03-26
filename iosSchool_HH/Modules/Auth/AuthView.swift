//
//  AuthView.swift
//  iosSchool_HH
//
//  Created by MaximM on 06.11.2023.
//

import UIKit

protocol AuthView: UIView {
    var delegate: AuthViewDelegate? { get set }

    func setView()
}

protocol AuthViewDelegate: AnyObject {
    func loginButtonDidTap(login: String, password: String)
    func registrationButtonDidTap()
}

class AuthViewImp: UIView, AuthView {

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var registrationButton: UIButton!

    weak var delegate: AuthViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        addGestureRecognizer(recognizer)

        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.backgroundColor = UIColor(named: "grayAuthBackground")

        labelView.layer.cornerRadius = 10
        labelView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.55).cgColor
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowRadius = 5
        labelView.layer.shadowOffset = CGSize(width: 0, height: 5)
        let shadowRect = CGRect(
            x: 0, y: labelView.bounds.height - 5.0,
            width: labelView.bounds.width, height: 5.0
        )
        let shadowPath = UIBezierPath(rect: shadowRect)
        labelView.layer.shadowPath = shadowPath.cgPath
        labelView.backgroundColor = UIColor(named: "grayAuthLabel")

        loginTextField.setLeftPaddingInTextfield(padding: 16)
        loginTextField.backgroundColor = UIColor(named: "grayBackgroundAuthTextField")

        passwordTextField.setLeftPaddingInTextfield(padding: 16)
        passwordTextField.backgroundColor = UIColor(named: "grayBackgroundAuthTextField")

        implementBasicViewShadowSettings(loginButton)
        loginButton.layer.cornerRadius = 10

        implementBasicViewShadowSettings(registrationButton)
        registrationButton.layer.cornerRadius = 10

        registrationButton.addTarget(self, action: #selector(registrationDidTap), for: .touchUpInside)

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
    }

    func implementBasicViewShadowSettings<T: UIView>(_ view: T) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    // MARK: - Private methods

    @IBAction
    private func loginDidTap(sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        delegate?.loginButtonDidTap(
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }

    @IBAction
    private func registrationDidTap() {
        delegate?.registrationButtonDidTap()
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
    }
}
