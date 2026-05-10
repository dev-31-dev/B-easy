import UIKit

extension UITableView {

    func setEmptyState(message: String, icon: String? = nil) {
        let footerHeight: CGFloat = 200
        let container = UIView(frame: CGRect(x: 0, y: 0,
                                             width: bounds.width,
                                             height: footerHeight))

        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        if let iconName = icon {
            let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .light)
            let imageView = UIImageView(image: UIImage(systemName: iconName,
                                                       withConfiguration: config))
            imageView.tintColor = .tertiaryLabel
            imageView.contentMode = .scaleAspectFit
            stack.addArrangedSubview(imageView)
        }

        let label = UILabel()
        label.text = message
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        stack.addArrangedSubview(label)

        container.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: 32),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -32)
        ])

        tableFooterView = container
        // Never block scrolling
        isScrollEnabled = true
    }

    func clearEmptyState() {
        tableFooterView = nil
    }
}
