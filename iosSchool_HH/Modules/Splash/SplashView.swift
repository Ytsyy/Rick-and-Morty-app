//
//  SplashView.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation
import UIKit

protocol SplashView: UIView {
    func setView()
}

class SplashViewImp: UIView, SplashView {
    @IBOutlet private var splashImageView: UIImageView!

    func setView() {
        self.backgroundColor = UIColor(named: "iceberg")
    }

}
