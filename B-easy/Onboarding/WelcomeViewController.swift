import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func letsStartTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignIn", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSignIn" {
            // pass data if needed
        }
    }
}
