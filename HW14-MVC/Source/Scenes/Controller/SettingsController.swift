//
//  SettingsController.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

class SettingsController: UIViewController {
    let settingsTableView = UITableView()

         override func viewDidLoad() {
             super.viewDidLoad()

             view.backgroundColor = .red

             setupHierarchy()
             setupLayout()
         }

         override func viewWillAppear(_ animated: Bool) {
             setupNavigation()
         }

         // MARK: - Settings

         private func setupHierarchy() {
             view.addSubview(settingsTableView)
         }

         private func setupLayout() {
             settingsTableView.translatesAutoresizingMaskIntoConstraints = false
             settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
             settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
             settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
             settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
         }

         private func setupNavigation() {
             navigationItem.title = "Настройки"
             navigationController?.navigationBar.backgroundColor = .white
             let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: UIFont.Weight.semibold)]
             navigationController?.navigationBar.titleTextAttributes = attributes
         }
}
