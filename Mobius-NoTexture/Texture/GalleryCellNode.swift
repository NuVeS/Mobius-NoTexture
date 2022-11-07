//
//  GalleryCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import UIKit
import LoremIpsum
import AsyncDisplayKit

class GalleryCellNode: ASCellNode {
    
    let mainImageNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.isOpaque = true
        imageNode.backgroundColor = .white
        imageNode.isLayerBacked = true
        imageNode.contentMode = UIView.ContentMode.scaleToFill
        return imageNode
    }()
    
    override init() {
        super.init()
        isOpaque = true
        automaticallyManagesSubnodes = true
        
        LoremIpsum.asyncPlaceholderImage(from: .placeKitten,with: CGSize(width: 400, height: 200)) { [weak self] (image) in
            self?.mainImageNode.image = image
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let resultLayout = ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .spaceAround, alignItems: .stretch,
            children: [mainImageNode])
        resultLayout.alignContent = .center
        return resultLayout
    }
}
