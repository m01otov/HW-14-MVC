//
//  SettingsController.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

class SettingsController: UIViewController {
    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()
        model = SettingsModel()

        configureView()
    }

     override func viewWillAppear(_ animated: Bool) {
         (view as? SettingsView)?.setupNavigation(self)
     }

}

// MARK: - Configuration

private extension SettingsController {
    func configureView() {
        guard let models = model?.createModels() else { return }
        settingsView?.configureView(with: models)
    }
}
