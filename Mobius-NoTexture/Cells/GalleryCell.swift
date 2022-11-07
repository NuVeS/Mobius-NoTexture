//
//  GalleryCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import LoremIpsum

final class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with image: String) {
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten, with: CGSize(width: 400, height: 200)) {[weak self] image in
            self?.imageView.image = image
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
