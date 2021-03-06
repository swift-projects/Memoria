
import Foundation
import UIKit

class Label : UILabel {
    
    func defaultyTitleLargeGrayBold() {
        self.font =  UIFont.boldSystemFont(ofSize: 22.0)
           self.textColor = Colors.gray()
    }
    
    func defaultyTitleLargeBold() {
        self.font =  UIFont.boldSystemFont(ofSize: 22.0)
        self.textColor = UIColor.black
    }
    
    func defaultyTitleLarge() {
        self.font =  UIFont.systemFont(ofSize: 22.0)
        self.textColor = UIColor.black
    }
    
    func defaultyTitle() {
        self.font =  UIFont.systemFont(ofSize: 19.0)
        self.textColor = UIColor.black
    }
    
    func defaultTitleGray() {
        self.defaultyTitle()
        self.textColor = Colors.gray()
    }
    
    func defaultTitleGrayBold() {
        self.font =  UIFont.boldSystemFont(ofSize: 19.0)
        self.textColor = Colors.gray()
    }
    
    func defaultySubtitle() {
        self.font = UIFont.systemFont(ofSize: 17.0)
        self.textColor = Colors.gray()
    }
    
    func defaultySubtitleGray() {
        self.defaultySubtitle()
        self.textColor = Colors.gray()
    }

}
