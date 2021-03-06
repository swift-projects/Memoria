
import Foundation
import UIKit

class ViewController : UIViewController {
    let defaultBackgroundColor = UIColor(rgba: "#e9f0f4")
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = defaultBackgroundColor
    }
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
