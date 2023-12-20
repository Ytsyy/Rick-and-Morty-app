//
//  PersonEpisodeCell.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func layoutSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(127),
                heightDimension: .fractionalHeight(127)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(127),
                heightDimension: .fractionalHeight(127)
            )
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        section.orthogonalScrollingBehavior = .continuous
            return section
        }

     func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
    }
}
