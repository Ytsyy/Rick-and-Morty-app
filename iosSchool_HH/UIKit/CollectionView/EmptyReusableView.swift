//
//  EmptyReusableView.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import Foundation

class EmptyReusableView: UICollectionReusableView, CoreNibReusable {
    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        nil
    }

    func update(with _: Void) {
        self
    }
}
