//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View>{

    private let dataProvider: RegistrationDataProvider
    var onRegistrationSuccess: (() -> Void)?

    init(dataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        rootView.setView()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        onRegistrationSuccess?()
        print("onRegistrationSuccess executed on registration: \(onRegistrationSuccess != nil)")
    }
}
