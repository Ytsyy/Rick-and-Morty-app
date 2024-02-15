//
//  LocationCell.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import UIKit

class LocationCell: UITableViewCell {

    var data: LocationCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var locationTypeLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var chevron: UIImageView!
    @IBOutlet private weak var bottomLine: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
    }
    
    // MARK: Private methods

    private func update(data: LocationCellData) {
        nameLabel.text = data.name
        locationTypeLabel.text = data.type
        populationLabel.text = data.population
    }
}
