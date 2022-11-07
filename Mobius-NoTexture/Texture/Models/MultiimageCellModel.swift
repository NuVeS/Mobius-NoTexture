//
//  TextureMultiimageCellModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 28.10.2022.
//

import LoremIpsum

struct TextureMultiimageModel: TextureCellModel {
    let title: NSAttributedString
    let images: [String]
    
    init() {
        title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.systemFont(ofSize: 19, weight: .medium)])
        images = ["", "", "", ""]
    }
}
