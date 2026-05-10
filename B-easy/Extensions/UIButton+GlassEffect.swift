import UIKit

extension UIButton {
    static func applyGlassStyle(to button: UIButton, color: UIColor = .clear) {
                
                var config = UIButton.Configuration.glass()
                config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
                config.baseForegroundColor = .white
                
                button.backgroundColor = color
                button.configuration = config
            }
}
