//
//  LottieCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import Lottie

final class LottieCell: UICollectionViewCell, Cell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animationViewImage: AnimationView!
    @IBOutlet weak var cardView: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.shadowOpacity = 0.6
        cardView.layer.masksToBounds = false
        
//         FIXME: Blend shadow
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
//        titleLabel.backgroundColor = .white
    }
    
    func configure(with model: ViewModel) {
        guard let model = model as? LottieModel else {
            fatalError("Wrong model for AdCell: \(model.self)")
        }
        
        titleLabel.text = model.title

        animationViewImage.animation = model.animation
        animationViewImage.play(toProgress: .infinity, loopMode: LottieLoopMode.autoReverse)
    }
    
    // FIXME: practice
    override func prepareForReuse() {
        super.prepareForReuse()
        animationViewImage.animation = nil
    }
}

//extension LottieCell: DisplayControllCell {
//    func willDisplay(model: ViewModel) {
//        animationViewImage.play(toProgress: .infinity, loopMode: LottieLoopMode.autoReverse)
//    }
//
//    func endDisplay() {
//        animationViewImage.stop()
//    }
//}
