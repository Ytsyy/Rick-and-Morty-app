//
//  CoreReusableView.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import Foundation
import UIKit

protocol CoreReusableView: UICollectionReusableView, CoreNibReusable {
    associatedtype inputData

    static func layout()-> NSCollectionLayoutBoundarySupplementaryItem
    func update(with inputData: InputData) -> Self
}
