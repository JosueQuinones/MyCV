//
//  CardView.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 6/3/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    
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
    
    @IBInspectable var isRounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    //MARK: - Override methods
    override func layoutSubviews() {
        super.layoutSubviews()
        updateBorderWidth()
        updateBorderColor()
        updateCornerRadius()
    }
    
    override func draw(_ rect: CGRect) {
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        currentContext.saveGState()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 20)
        currentContext.addPath(path.cgPath)
        currentContext.clip()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let startColor = UIColor.mainBlack
        guard let startColorComponents = startColor?.cgColor.components else {
            return
        }
        
        let endColor = UIColor.secondDarkGray
        guard let endColorComponents = endColor?.cgColor.components else {
            return
        }
      
        let colorComponents: [CGFloat]
            = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        let locations:[CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else {
            return }
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0,y: bounds.height)
        
        currentContext.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        currentContext.restoreGState()
    }
    
    //MARK: - Update properties
    private func updateCornerRadius() {
        if isRounded {
            layer.cornerRadius = 20
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
