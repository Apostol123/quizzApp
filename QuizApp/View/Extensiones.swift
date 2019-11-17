//
//  Extensiones.swift
//  04-Piano
//
//  Created by user159106 on 10/27/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit


@IBDesignable extension UIButton {
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
           return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
           guard let uiColor = newValue else {return}
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
