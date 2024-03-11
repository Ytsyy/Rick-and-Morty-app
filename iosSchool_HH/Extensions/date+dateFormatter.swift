//
//  date+dateFormatter.swift
//  iosSchool_HH
//
//  Created by Maxim on 11.03.2024.
//

import Foundation

extension Date {
    var dateTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY"
        return dateFormatter.string(from: self)
    }
}
