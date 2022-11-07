//
//  PlayerView.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import Foundation
import AVKit

final class PlayerView: UIView {
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var player: AVQueuePlayer?
    private var playerLayer: AVPlayerLayer?
    private var looper: AVPlayerLooper?
    
    func setPlayer(player: AVQueuePlayer, item: AVPlayerItem) {
        playerLayer?.removeFromSuperlayer()
        playerLayer = AVPlayerLayer(player: player)
        looper = AVPlayerLooper(player: player, templateItem: item)
        layer.addSublayer(playerLayer!)
        
        self.player = player
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
}
