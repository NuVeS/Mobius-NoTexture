//
//  ProductCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import UIKit
import LoremIpsum
import AsyncDisplayKit

final class ProductCellNode: BaseCellNode {
        
    let mainImageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.isOpaque = true
        imageNode.backgroundColor = .white
        imageNode.isLayerBacked = true
        imageNode.contentMode = UIView.ContentMode.scaleToFill
        return imageNode
    }()
    
    let priceNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.backgroundColor = .white
        textNode.isOpaque = true
        textNode.isLayerBacked = true
        return textNode
    }()
    
    init(model: TextureProductModel) {
        super.init()
        
        titleNode.attributedText = NSAttributedString(string: model.text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
        priceNode.attributedText = NSAttributedString(string: model.price, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19, weight: .semibold)])
        
        LoremIpsum.asyncPlaceholderImage(from: .dummyImage, with: .init(width: 40, height: 40)) {[weak self] image in
            self?.avatarNode.image = image
        }
        
        LoremIpsum.asyncPlaceholderImage(from: .dummyImage, with: .init(width: 400, height: 400)) {[weak self] image in
            self?.mainImageNode.image = image
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let imageRatioSpec = ASRatioLayoutSpec(ratio: 1, child: mainImageNode)
        imageRatioSpec.style.flexShrink = 1
        imageRatioSpec.style.flexGrow = 10
        imageRatioSpec.style.alignSelf = .center
        
        let imageStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceAround, alignItems: .center, children: [imageRatioSpec])
        imageStack.style.alignSelf = .center
        imageStack.style.maxHeight = ASDimension(unit: .points, value: 100)
        imageStack.style.minWidth = ASDimension(unit: .points, value: constrainedSize.max.width - 40)
        
        
        let mainStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [imageStack, priceNode, titleNode, avatarNode])
        
        let mainInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), child: mainStack)
        
        avatarNode.style.alignSelf = .end
        avatarNode.style.preferredSize = CGSize(width: 40, height: 40)

        let bubbleStack = ASBackgroundLayoutSpec(child: mainInsetStack, background: bubbleNode)
        let bubbleInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: bubbleStack)

        let resultLayout = ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .spaceAround, alignItems: .stretch,
            children: [bubbleInsetStack])
        resultLayout.alignContent = .center
        return resultLayout
        
        
    }
}
