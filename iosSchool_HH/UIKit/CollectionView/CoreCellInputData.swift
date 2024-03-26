//
//  CoreCellInputData.swift
//  iosSchool_HH
//
//  Created by MaximM on 07.12.2023.
//

import Foundation

protocol CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)? { get }
}
