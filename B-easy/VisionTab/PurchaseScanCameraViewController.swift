import UIKit

final class PurchaseScanCameraViewController: SalesScanCameraViewController {
    @IBOutlet private weak var purchasePreviewView: UIView!
    @IBOutlet private weak var purchaseIndicationLabel: UILabel!
    @IBOutlet private weak var purchaseShutter: UIButton!
    @IBOutlet private weak var purchaseActivity: UIActivityIndicatorView!
    @IBOutlet private weak var purchaseCloseButton: UIButton!

    required init?(coder: NSCoder) {
        super.init(coder: coder, mode: .purchase)
    }

    override func configureStoryboardUI() {
        previewView = purchasePreviewView
        indicationLabel = purchaseIndicationLabel
        shutterButton = purchaseShutter
        activityIndicator = purchaseActivity
        closeButton = purchaseCloseButton

        purchaseShutter.removeTarget(nil, action: nil, for: .touchUpInside)
        purchaseShutter.addTarget(self, action: #selector(handlePurchaseCaptureTap), for: .touchUpInside)
        purchaseCloseButton.removeTarget(nil, action: nil, for: .touchUpInside)
        purchaseCloseButton.addTarget(self, action: #selector(handlePurchaseCloseTap(_:)), for: .touchUpInside)

        super.configureStoryboardUI()
    }

    override func currentSaleIntent() -> SaleScanIntent {
        .bill
    }
    private static let storyboardIdentifier = "PurchaseScanCameraViewController"

    static func instantiate(storyboard: UIStoryboard? = nil) -> PurchaseScanCameraViewController {
        let storyboard = storyboard ?? UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: storyboardIdentifier) { coder in
            PurchaseScanCameraViewController(coder: coder)
        }
    }

    @objc private func handlePurchaseCaptureTap() {
        captureTapped()
    }

    @objc private func handlePurchaseCloseTap(_ sender: UIButton) {
        closeTapped(sender)
    }
}
