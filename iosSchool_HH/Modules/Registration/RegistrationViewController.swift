//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {

    private let dataProvider: RegistrationDataProvider

    init(dataProvider: RegistrationDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}
