//
//  UIImageView+imageURL.swift
//  MyCV
//
//  Created by Josue Emanuel Quinones Rivera on 5/31/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundImage(url: URL) {
        let size = CGSize(width: 400, height: 400)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 420, height: 420))
        image = renderer.image { context in
            context.cgContext.addEllipse(in: CGRect(origin: CGPoint(x: 10, y: 10), size: size))
            context.cgContext.clip()
            image?.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func roundImageWithShadow(url: URL) {
        let size = CGSize(width: 400, height: 400)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 420, height: 420))
        image = renderer.image { context in
            context.cgContext.setShadow(offset: .zero, blur: 18, color: UIColor.extraLightGray?.cgColor)
            context.cgContext.fillEllipse(in: CGRect(origin: CGPoint(x: 10, y: 10), size: size))
            context.cgContext.addEllipse(in: CGRect(origin: CGPoint(x: 10, y: 10), size: size))
            context.cgContext.clip()
            image?.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
