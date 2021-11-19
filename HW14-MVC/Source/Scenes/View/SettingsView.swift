//
//  SettingsView.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

final class SettingsView: UIView {

    // MARK: - Configuration
    func configureView(with models: [SettingsGroup]) {
        self.models = models
        settingsTable.reloadData()
    }

    // MARK: - Private properties

    private var models = [SettingsGroup]()

    // MARK: - Views

    private lazy var settingsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false

        table.delegate = self
        table.dataSource = self

        return table
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(settingsTable)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            settingsTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingsTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            settingsTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupNavigation(_ sender: UIViewController) {
        sender.navigationItem.title = "Настройки"
        sender.navigationController?.navigationBar.backgroundColor = .white
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)]
        sender.navigationController?.navigationBar.titleTextAttributes = attributes
    }

}

// MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = models[indexPath.section].settings[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier,
        for: indexPath) as! SettingsTableViewCell
        cell.settingItem = setting
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(models[indexPath.section].settings[indexPath.item].name)")
    }
}
