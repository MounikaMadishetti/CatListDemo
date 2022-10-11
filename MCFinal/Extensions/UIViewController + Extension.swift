//
//  UIViewController + Extension.swift
//  MCFinal
//
//  Created by Mounika Madishetti on 09/10/22.
//

import Foundation
import UIKit
extension UIViewController {
    static var identifer: String {
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identifer) as! Self
        return vc
    }
}
