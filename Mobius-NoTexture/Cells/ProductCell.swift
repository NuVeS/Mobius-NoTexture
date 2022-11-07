//
//  ProductCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import LoremIpsum

final class ProductCell: UICollectionViewCell, Cell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.layer.shadowOpacity = 0.6
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.masksToBounds = false

        avatarImageView.layer.cornerRadius = 20
        avatarImageView.layer.masksToBounds = true
                        
        
        // FIXME: Blend shadow
//        let imageView = cardCornerImage(size: cardView.bounds.size)
//        cardView.insertSubview(imageView, at: 0)
//
//        NSLayoutConstraint.activate([
//            imageView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
//            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
//        ])

        // FIXME: Blend
//        textLabel.backgroundColor = .white
//        priceLabel.backgroundColor = .white
//        avatarImageView.backgroundColor = .white
    }
    
    func configure(with model: ViewModel) {
        guard let model = model as? ProductModel else {
            fatalError("Wrong model for ProductCell: \(model.self)")
        }
        
        textLabel.text = model.text
        priceLabel.text = model.price
        
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten, with: .init(width: 40, height: 40)) {[weak self] image in
            self?.avatarImageView.image = image
            
            // FIXME: Misaligned image
//            self?.avatarImageView.image = image?.roundedImage()
        }
        
        // FIXME: Misaligned image 400 400
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten, with: .init(width: 800, height: 800)) {[weak self] image in
            self?.mainImageView.image = image
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        mainImageView.image = nil
    }
    
}
