//
//  SettingsModel.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

final class SettingsModel {

    func createModels() -> [SettingsGroup] {
        let settings = [
            SettingsGroup(id: 0, settings: [
                Setting(name: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackground: .systemOrange, isChecked: true, rightText: nil, badge: nil),
                Setting(name: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackground: .systemBlue, isChecked: nil, rightText: "Не подключено", badge: nil),
                Setting(name: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackground: .systemBlue, isChecked: nil, rightText: "Вкл.", badge: nil),
                Setting(name: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackground: .systemGreen, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackground: .systemGreen, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "VPN", icon: UIImage(systemName: "point.3.connected.trianglepath.dotted"), iconBackground: .systemBlue, isChecked: false, rightText: nil, badge: nil)
            ]),
            SettingsGroup(id: 1, settings: [
                Setting(name: "Уведомления", icon: UIImage(systemName: "bell.badge.fill"), iconBackground: .systemPink, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackground: .systemPink, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackground: .systemPurple, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackground: .systemPurple, isChecked: nil, rightText: nil, badge: nil)
            ]),
            SettingsGroup(id: 2, settings: [
                Setting(name: "Основные", icon: UIImage(systemName: "gear"), iconBackground: .systemGray, isChecked: nil, rightText: nil, badge: 1),
                Setting(name: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackground: .systemGray, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Экран и яркость", icon: UIImage(systemName: "a.square.fill"), iconBackground: .systemBlue, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Экран домой", icon: UIImage(systemName: "rectangle.on.rectangle"), iconBackground: .systemBlue, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Универсальный доступ", icon: UIImage(systemName: "figure.roll"), iconBackground: .systemBlue, isChecked: nil, rightText: nil, badge: nil),
                Setting(name: "Обои", icon: UIImage(systemName: "aqi.medium"), iconBackground: .systemBlue, isChecked: nil, rightText: nil, badge: nil)
            ])
        ]
        return settings
    }
}
