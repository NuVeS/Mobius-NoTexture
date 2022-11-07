//
//  MiltiimageCellNode.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import Foundation
import AsyncDisplayKit

final class MultiimageCellNode: BaseCellNode {
    
    private let model: TextureMultiimageModel
    private lazy var collectionNode: ASCollectionNode = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = ASCollectionNode(collectionViewLayout: layout)
        collection.isOpaque = true
        collection.dataSource = self
        
        return collection
    }()
    
    private var timer: Timer?
    private var currentScrolled = 0
    
    init(model: TextureMultiimageModel) {
        self.model = model
        super.init()
        
        titleNode.attributedText = model.title
        
        
        ASPerformBlockOnMainThread {
            self.collectionNode.reloadData()
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.scrollNext), userInfo: nil, repeats: true)
        }
    }
    
    @objc
    private func scrollNext() {
        currentScrolled = currentScrolled == 3 ? 0 : currentScrolled + 1
        collectionNode.scrollToItem(at: IndexPath(row: currentScrolled, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let textAvatarStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .center,
            children: [collectionNode, titleNode])
        
        collectionNode.style.maxHeight = ASDimension(unit: .points, value: 128)
        collectionNode.style.minWidth = ASDimension(unit: .points, value: 250)
        
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

extension MultiimageCellNode: ASCollectionDelegate, ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(
            CGSize(width: collectionNode.view.bounds.width / 3, height: 128)
//            CGSize(width: collectionNode.view.bounds.width, height: 128)
        )
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return model.images.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { GalleryCellNode() }
    }
}
