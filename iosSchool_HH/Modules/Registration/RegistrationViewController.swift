//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit
import SPIndicator
import PKHUD

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    private let storageManager: StorageManager
    var onRegistrationSuccess: (() -> Void)?

    init(dataProvider: RegistrationDataProvider, storageManager: StorageManager, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess
        self.storageManager = storageManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        rootView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onRegistrationSuccess?()
    }

    /*func registration() {
        dataProvider.registration(username: "MaximMarin5", password: "123456789") { [weak self] token, error in
            guard let token = token else {
                print("Нет токена")
                return
            }
            print("Токен: \(token)")
            print(error?.rawValue ?? "Нет ошибки")
            self?.storageManager.saveLastLoginDate()
        }
    }
     */
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
    func registrationButtonDidTap(login: String, password: String, repeatPassword: String) {
        guard password == repeatPassword else {
            DispatchQueue.main.async {
                SPIndicator.present(title: "Пароли не совпадают", haptic: .error)
            }
            return
        }

        HUD.show(.progress)
        dataProvider.registration(username: login, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, let token else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.storageManager.saveToken(token: token)
            self.onRegistrationSuccess?()
        }
    }

    func backButtonDidTap() {
        dismiss(animated: true)
    }
}
