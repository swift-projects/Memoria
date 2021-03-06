//
//  Colors.swift
//  Memoria
//
//  Created by Matan Cohen on 3/7/16.
//  Copyright © 2016 MACMatan. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    static func lightGreen()->UIColor {
        return UIColor(rgba: "#f4ffef")
    }
    
    static func green()->UIColor {
        return UIColor(rgba: "#59b58f")
    }

    static func lightBlue()->UIColor {
        return UIColor(rgba: "#b9cbd5")
    }

    static func blue()->UIColor {
        return UIColor(rgba: "#6d9de0")
    }
    
    static func red()->UIColor {
        return UIColor.red
    }
    
    static func gray()->UIColor {
        return UIColor(white: 0.6, alpha: 1)
    }
    
    static func lightGray()->UIColor {
        return UIColor(white: 0.8, alpha: 1)
    }
}
