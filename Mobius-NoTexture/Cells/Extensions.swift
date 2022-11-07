//
//  Extensions.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 10.10.2022.
//

import UIKit

extension UIImage {
    func opaqueImage(color: UIColor) -> UIImage {
        // UIGraphicsImageRenderer оптимизирует тк рисует с конкретным форматом
        let format = UIGraphicsImageRendererFormat(for: traitCollection)
        format.opaque = true
        let rect = CGRect(origin: .zero, size: size)
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.setFill()
            UIBezierPath(rect: rect).fill()
            draw(in: rect)
        }
    }
    
    func roundedImage(color: UIColor = .white) -> UIImage {
        let format = UIGraphicsImageRendererFormat(for: traitCollection)
        format.opaque = true
        let rect = CGRect(origin: .zero, size: size)
        let path = CGPath(roundedRect: rect, cornerWidth: 20, cornerHeight: 20, transform: nil)
        return UIGraphicsImageRenderer(size: size, format: format).image { context in
            color.setFill()
            context.fill(rect)
            
            UIBezierPath(cgPath: path).addClip()
            draw(in: rect)
        }
    }
}

extension UICollectionViewCell {
    // FIXME
    func cardCornerImage(size: CGSize) -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: "corners")
        imageView.image = image?
            .opaqueImage(color: .init(white: 0.95, alpha: 1))
            .resizableImage(withCapInsets: UIEdgeInsets(top: 18, left: 20, bottom: 20, right: 20), resizingMode: .stretch)
        imageView.contentMode = .scaleToFill

        // FIXME: Blend
        imageView.isOpaque = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func addCardImage() {
        
    }
}
