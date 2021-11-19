//
//  Settings.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

struct SettingsGroup {
    let id: Int
    let settings: [Setting]
}

struct Setting {
    let name: String
    let icon: UIImage?
    let iconBackground: UIColor?
    let isChecked: Bool?
    let rightText: String?
    let badge: Int?
}
