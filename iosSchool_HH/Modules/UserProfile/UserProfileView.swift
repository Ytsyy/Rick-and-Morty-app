//
//  UserProfileView.swift
//  iosSchool_HH
//
//  Created by Maxim on 26.02.2024.
//

import UIKit

protocol UserProfileView: UIView {
    func setView()
    func update(data: UserProfileViewData)
}

class UserProfileViewImp: UIView, UserProfileView {
    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    private var sections: [CoreSection] = []

    func setView() {
        collectionView.backgroundColor = UIColor(named: "silver")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func update(data: UserProfileViewData) {
        sections = [
            Sections.photoSection.create(data: data),
            Sections.usernameSection.create(data: data),
            Sections.dateColorSection.create(data: data),
            Sections.logoutSection.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    private enum Sections: Int {
        case photoSection
        case usernameSection
        case dateColorSection
        case logoutSection

        func create(data: UserProfileViewData) -> CoreSection {
            switch self {
            case .photoSection:
                return UserProfilePhotoSection(cellsData: [data.photoCellData])
            case .usernameSection:
                return UserProfileUsernameSection(cellsData: [data.usernameCellData])
            case .dateColorSection:
                return UserProfileDateColorSection(cellsData: data.dateColorCellData)
            case .logoutSection:
                return UserProfileLogoutSection(cellsData: [data.logoutCellData])
            }
        }
    }

    // MARK: - Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let layoutSection = sections[section].sectionLayoutProvider?(section, env) else {
                return nil
            }

            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension UserProfileViewImp: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension UserProfileViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.row)
    }
}

private extension UserProfileViewImp {
    typealias UserProfilePhotoSection = Section<UserProfilePhotoCell, EmptyReusableView, EmptyReusableView>
    typealias UserProfileUsernameSection = Section<UserProfileUsernameCell, EmptyReusableView, EmptyReusableView>
    typealias UserProfileDateColorSection = Section<UserProfileDateColorCell, EmptyReusableView, EmptyReusableView>
    typealias UserProfileLogoutSection = Section<UserProfileLogoutCell, EmptyReusableView, EmptyReusableView>
}
