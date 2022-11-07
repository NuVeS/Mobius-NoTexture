//
//  AdCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import UIKit
import LoremIpsum
import AsyncDisplayKit

class AdCellNode: BaseCellNode {
    private let model: TextureAdModel
    
    init(model: TextureAdModel) {
        self.model = model
        super.init()
        
        titleNode.attributedText = model.title
        descriptionNode.attributedText = model.description
        
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten,with: CGSize(width: 40, height: 40)) { [weak self] (image) in
            self?.avatarNode.image = image
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch,
            children: [titleNode, descriptionNode])
        textStack.style.flexShrink = 1
        
        let textAvatarStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start,
            children: [textStack, avatarNode])
        avatarNode.style.alignSelf = .end
        avatarNode.style.preferredSize = CGSize(width: 40, height: 40)
        
        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: textAvatarStack)
        
        let bubbleStack = ASBackgroundLayoutSpec(child: insetStack, background: bubbleNode)
        let bubbleInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: bubbleStack)
        
        let resultLayout = ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .spaceAround, alignItems: .stretch,
            children: [bubbleInsetStack])
        resultLayout.alignContent = .center
        return resultLayout
    }
}
