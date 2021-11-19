//
//  SettingsTableViewCell.swift
//  HW14-MVC
//
//  Created by Ilya Melnikov on 19.11.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsTableViewCell"

    // MARK: - Views

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let icon: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.tag = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var badgeContainer: UIView?
    private var additionalLabel: UILabel?

    private var toggle: UISwitch?

    var settingItem: Setting? {
        didSet {
            guard let item = settingItem else { return }

            label.text = item.name

            if let backgroundColor = item.iconBackground {
                iconContainer.backgroundColor = backgroundColor
            }

            if let iconItem = item.icon {
                icon.image = iconItem
            }

            if let toggleItem = item.isChecked {
                if toggle == nil {
                    toggle = UISwitch()
                    toggle?.translatesAutoresizingMaskIntoConstraints = false
                    toggle?.setOn(toggleItem, animated: true)
                    toggle?.addTarget(self, action: #selector(switchTap), for: .valueChanged)
                    if let toggle = toggle {
                        contentView.addSubview(toggle)
                    }
                }
            } else {
                accessoryType = .disclosureIndicator // стрелочка справа
            }
            if let badge = item.badge {
                badgeContainer = UIView()
                badgeContainer?.clipsToBounds = true
                badgeContainer?.layer.cornerRadius = (additionalLabel?.font.pointSize ?? 17) * Metric.multiplierCornerRadiusBadge
                badgeContainer?.backgroundColor = .systemRed
                badgeContainer?.translatesAutoresizingMaskIntoConstraints = false

                additionalLabel = UILabel()
                additionalLabel?.textAlignment = .center
                additionalLabel?.textColor = .white
                additionalLabel?.backgroundColor = .systemRed
                additionalLabel?.text = String(badge)
                additionalLabel?.translatesAutoresizingMaskIntoConstraints = false

                if let additionalLabel = additionalLabel {
                    badgeContainer?.addSubview(additionalLabel)
                }
                if let badgeContainer = badgeContainer {
                    contentView.addSubview(badgeContainer)
                }
            } else if let text = item.rightText {
                additionalLabel = UILabel()
                additionalLabel?.textAlignment = .right
                additionalLabel?.tintColor = .systemGray
                additionalLabel?.text = text
                additionalLabel?.translatesAutoresizingMaskIntoConstraints = false
                if let additionalLabel = additionalLabel {
                    contentView.addSubview(additionalLabel)
                }
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Settings

    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(icon)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }

    private func setupLayout() {
        let iconContainerSize: CGFloat = contentView.frame.size.height - Metric.offsetBackgroundIcon
        let iconSize: CGFloat = iconContainerSize / Metric.multiplierIcon

        NSLayoutConstraint.activate([
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.horizontalOffset),
            iconContainer.widthAnchor.constraint(equalToConstant: iconContainerSize),
            iconContainer.heightAnchor.constraint(equalToConstant: iconContainerSize),

            icon.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            icon.heightAnchor.constraint(equalToConstant: iconSize),
        ])
        toggle?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.horizontalOffset).isActive = true
        toggle?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        if let container = badgeContainer, let badge = additionalLabel {
            let width: CGFloat = CGFloat(badge.text?.count ?? 1) * 10 + 20
            badgeContainer?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            badgeContainer?.leadingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
            badgeContainer?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.spaceBetweenObjects).isActive = true
            badgeContainer?.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -Metric.horizontalOffset).isActive = true
            badgeContainer?.widthAnchor.constraint(equalToConstant: width).isActive = true
            additionalLabel?.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            additionalLabel?.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        } else if additionalLabel != nil {
            additionalLabel?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            additionalLabel?.leadingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
            additionalLabel?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.spaceBetweenObjects).isActive = true
            additionalLabel?.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        }

        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: Metric.spaceBetweenObjects).isActive = true
        if let additionalLabel = additionalLabel {
            label.trailingAnchor.constraint(equalTo: additionalLabel.leadingAnchor).isActive = true
        } else {
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.spaceBetweenObjects).isActive = true
        }
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }

    //MARK: - Actions

    @objc func switchTap(_ sender: UISwitch) {
        if let label = (sender.superview?.viewWithTag(1) as? UILabel) {
            print("\(label.text ?? "Unknown switch") changed to \(sender.isOn)")
        }
    }
}

// MARK: - Constants
extension SettingsTableViewCell {

    enum Metric {
        static let horizontalOffset: CGFloat = 16
        static let spaceBetweenObjects: CGFloat = 15
        static let offsetBackgroundIcon: CGFloat = 12
        static let multiplierIcon: CGFloat = 1.5
        static let multiplierCornerRadiusBadge: CGFloat = 0.8
    }
}
