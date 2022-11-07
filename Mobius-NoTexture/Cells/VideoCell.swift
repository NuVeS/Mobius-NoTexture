//
//  VideoCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import AVKit
import AVFoundation

final class VideoCell: UICollectionViewCell, Cell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var cardView: UIView!
    private var player: AVQueuePlayer?

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
//        titleLabel.backgroundColor = .white
    }
    
    func configure(with model: ViewModel) {
        guard let model = model as? VideoModel else {
            fatalError("Wrong model for VideoCell: \(model.self)")
        }
        
        titleLabel.text = model.title
        
        let url = URL(fileURLWithPath: model.video)
        player = AVQueuePlayer()
        let item = AVPlayerItem(url: url)
        playerView.setPlayer(player: player!, item: item)
        
        playerView.player?.play()
    }

}

//extension VideoCell: DisplayControllCell {
//    func willDisplay(model: ViewModel) {
//        playerView.player?.play() // FIXME: //
//    }
//
//    func endDisplay() {
//        playerView.player?.pause()
//    }
//}
