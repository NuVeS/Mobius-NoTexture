//
//  ProductModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import Foundation
import LoremIpsum

struct TextureProductModel: TextureCellModel {
    let id: String = "ProductCell"
    
    let price: String
    let text: String
    let imageName: String?
    let avatarName: String?
    
    init() {
        price = "\((100..<1000).randomElement() ?? 100)"
        text = LoremIpsum.sentences(withNumber: (1...6).randomElement() ?? 2)
        imageName = nil
        avatarName = nil
    }
}
