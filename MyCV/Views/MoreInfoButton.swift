//
//  moreInfoButton.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 6/3/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

@IBDesignable class MoreInfoButton: UIButton {

    @IBInspectable var isRounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateBorderWidth()
        }
    }
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            updateBorderColor()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
        updateBorderWidth()
        updateBorderColor()
    }
    
    private func updateCornerRadius() {
        if isRounded {
            let aspect = min(bounds.size.width, bounds.size.height)
            layer.cornerRadius = aspect / 2
        } else {
            layer.cornerRadius = 0
        }
    }
    
    private func updateBorderWidth() {
        if borderWidth > 0 {
            layer.borderWidth = borderWidth
        } else {
            layer.borderWidth = 0
        }
    }
    
    private func updateBorderColor() {
        layer.borderColor = borderColor.cgColor
    }
}
