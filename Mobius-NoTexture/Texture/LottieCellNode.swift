//
//  LottieCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import UIKit
import LoremIpsum
import AsyncDisplayKit
import Lottie

class LottieCellNode: BaseCellNode {
    private var model: TextureLottieModel!
    
    private var animationNode: AnimationNode!
    
    var animationView: AnimationView!
    
    init(model: TextureLottieModel) {
        super.init()
        
        self.model = model
        ASPerformBlockOnMainThread {
            self.animationView = AnimationView(frame: .zero)
        }
        
        animationNode = AnimationNode(animation: model.animation)
        
        titleNode.attributedText = model.title
        
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten,with: CGSize(width: 40, height: 40)) { [weak self] (image) in
            self?.avatarNode.image = image
        }
    }
        
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let mainStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start,
            children: [titleNode, animationNode])
        animationNode.style.maxHeight = ASDimension(unit: .points, value: 128)
        animationNode.style.minWidth = ASDimension(unit: .points, value: 250)
        
        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: mainStack)
        
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
            self.animationNode.loop()
        }
    }
    
    override func endDisplay() {
        ASPerformBlockOnMainThread {
            self.animationNode.stop()
        }
    }
}
