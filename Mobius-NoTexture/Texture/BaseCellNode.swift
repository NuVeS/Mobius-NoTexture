//
//  BaseCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import Foundation
import UIKit
import AsyncDisplayKit

class BaseCellNode: ASCellNode {
    let titleNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.backgroundColor = .white
        textNode.isOpaque = true
        textNode.isLayerBacked = true
        return textNode
    }()

    let descriptionNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.backgroundColor = .white
        textNode.isOpaque = true
        textNode.isLayerBacked = true
        return textNode
    }()

    let avatarNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.style.preferredSize = CGSize(width: 16, height: 16)
        imageNode.cornerRoundingType = .precomposited
        imageNode.cornerRadius = 16
        imageNode.isOpaque = true
        imageNode.isLayerBacked = true
        imageNode.backgroundColor = .white
        return imageNode
    }()

//    let bubbleNode: ASDisplayNode = {
//        let displayNode = ASDisplayNode()
//        displayNode.backgroundColor = .white
//        displayNode.cornerRadius = 20
//
//        displayNode.shadowRadius = 2
//        displayNode.shadowOffset = CGSize(width: 1, height: 1)
//        displayNode.shadowColor = UIColor.black.cgColor
//        displayNode.shadowOpacity = 0.6
//
//        displayNode.isOpaque = true
//        displayNode.isLayerBacked = true
//
//        return displayNode
//    }()

    let bubbleNode: ASDisplayNode = {
        let backgroundImage = #imageLiteral(resourceName: "corners")

        let node = ASDisplayNode(viewBlock: {
            let view = UIImageView()
            view.image = backgroundImage
                .opaqueImage(color: UIColor(white: 0.95, alpha: 1))
                .resizableImage(
                    withCapInsets: UIEdgeInsets(top: 18, left: 20, bottom: 20, right: 20),
                    resizingMode: .stretch)
            view.contentMode = .scaleToFill
            return view
        })
        node.needsDisplayOnBoundsChange = true
        node.displaysAsynchronously = false
        return node
    }()

    override init() {
        super.init()
        isOpaque = true
        automaticallyManagesSubnodes = true
    }
}

extension BaseCellNode {
    @objc func willDisplay() {
        //
    }
    
    @objc func endDisplay() {
        //
    }
}
