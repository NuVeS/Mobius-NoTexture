//
//  TextureViewController.swift
//  UIPerformance
//
//  Created by Sergey P on 8/17/20.
//  Copyright © 2020 Sergey P. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit
import LoremIpsum

class TextureViewController: ASDKViewController<ASCollectionNode> {
    
    lazy var models: [TextureCellModel] = TextureViewController.loadModels()


    override init() {
        let layout = UICollectionViewFlowLayout()

        super.init(node: ASCollectionNode(collectionViewLayout: layout))
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        node.delegate = self
        node.dataSource = self
        node.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        node.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    private class func loadModels() -> [TextureCellModel] {
        return (0...2000).map { number in
            switch number % 5 {
//            case 0: return TextureProductModel()
//            case 1: return TextureAdModel()
//            case 2: return TextureLottieModel()
//            case 3: return TextureVideoModel()
//            case 4: return TextureMultiimageModel()
            default: return TextureProductModel()
            }
        }
    }
}

extension TextureViewController: ASCollectionDelegate, ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(
            CGSize(width: 333.0, height: 0),
            CGSize(width: 333.0, height: .greatestFiniteMagnitude)
        )
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let model = models[indexPath.item]
        return {
            switch model {
            case let model as TextureAdModel:
                return AdCellNode(model: model)
            case let model as TextureProductModel:
                return ProductCellNode(model: model)
            case let model as TextureLottieModel:
                return LottieCellNode(model: model)
            case let model as TextureVideoModel:
                return VideoCellNode(model: model)
            case let model as TextureMultiimageModel:
                return MultiimageCellNode(model: model)
            default:
                return ASCellNode()
            }
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, willDisplayItemWith node: ASCellNode) {
        (node as? BaseCellNode)?.willDisplay()
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didEndDisplayingItemWith node: ASCellNode) {
        (node as? BaseCellNode)?.endDisplay()
    }
}
