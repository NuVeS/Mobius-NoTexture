//
//  AdCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import LoremIpsum

final class AdCell: UICollectionViewCell, Cell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
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

        avatarImage.layer.cornerRadius = 20
        avatarImage.layer.masksToBounds = true
        
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
//        titleLabel.backgroundColor = .white
//        avatarImage.backgroundColor = .white
    }
    
    func configure(with model: ViewModel) {
        guard let model = model as? AdModel else {
            fatalError("Wrong model for AdCell: \(model.self)")
        }
        
        textLabel.text = model.text
        titleLabel.text = model.title
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten, with: .init(width: 40, height: 40)) {[weak self] image in
            self?.avatarImage.image = image
            
//         FIXME: Misaligned image
//            self?.avatarImage.image = image?.roundedImage()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
    }
}
