import UIKit
import SPIndicator
import PKHUD

class UserProfileViewController<View: UserProfileView>: BaseViewController<View> {
    private let dataProvider: UserProfileDataProvider
    private let storageManager: StorageManager

    private var onProfileLogout: (() -> Void)?

    init(dataProvider: UserProfileDataProvider, storageManager: StorageManager, onProfileLogout: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onProfileLogout = onProfileLogout

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        HUD.show(.progress)
        guard let user = storageManager.getUserId() else {
            showError()
            return
        }
        dataProvider.profile(userId: user) { [weak self] profile, error in
            guard let self, let profile, error == nil else {
                self?.showError()
                return
            }

            update(username: profile.username)
        }
    }

    // MARK: - Private func

    private func showError() {
        DispatchQueue.main.async {
            HUD.hide()
            SPIndicator.present(title: "Ошибочка", haptic: .error)
            self.update(username: "")
        }
    }

    private func update(username: String) {
        DispatchQueue.main.async {
            HUD.hide()
            self.rootView.update(
                data: .init(
                    image: (UIImage(named: "registration-avatar")) ?? UIImage(),
                    username: username,
                    date: self.storageManager.getDateLastLogin(),
                    color: UIColor(named: "iceberg") ?? UIColor(),
                    logoutClosure: { [weak self] _ in
                        self?.storageManager.removeToken()
                        self?.storageManager.removeUserId()
                        self?.onProfileLogout?()
                    }
                )
            )
        }
    }
}
