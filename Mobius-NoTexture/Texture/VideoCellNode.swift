//
//  VideoCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import UIKit
import LoremIpsum
import AsyncDisplayKit

class VideoCellNode: BaseCellNode {
    private let model: TextureVideoModel
    
    private let videoNode: ASVideoNode = {
        let video = ASVideoNode()
        video.isOpaque = true
        video.backgroundColor = .white
        return video
    }()
    
    init(model: TextureVideoModel) {
        self.model = model
        super.init()
        
        titleNode.attributedText = model.title
        
        self.videoNode.shouldAutorepeat = true
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let textAvatarStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, flexWrap: .noWrap, alignContent: .stretch,
            children: [titleNode, videoNode])
        
        videoNode.style.maxHeight = ASDimension(unit: .points, value: 158)
        videoNode.style.minWidth = ASDimension(unit: .points, value: 250)
        
        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: textAvatarStack)
        
        let bubbleStack = ASBackgroundLayoutSpec(child: insetStack, background: bubbleNode)
        let bubbleInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: bubbleStack)
        
        let resultLayout = ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .spaceAround, alignItems: .stretch,
            children: [bubbleInsetStack])
        resultLayout.alignContent = .center
        return resultLayout
    }
    
    override func willDisplay() {
        ASPerformBlockOnMainThread {
            self.videoNode.assetURL = self.model.videoURL
            self.videoNode.play()
        }
    }
    
    override func endDisplay() {
        ASPerformBlockOnMainThread {
            self.videoNode.pause()
        }
    }
}
