//
//  CoreReusableView.swift
//  iosSchool_HH
//
//  Created by MaximM on 07.12.2023.
//

import Foundation
import UIKit

protocol CoreReusableView: UICollectionReusableView, CoreNibReusable {
    associatedtype InputData

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem?
    func update(with inputData: InputData) -> Self
}
