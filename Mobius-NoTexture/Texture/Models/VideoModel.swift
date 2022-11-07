//
//  TextureVideoModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import Foundation
import LoremIpsum

struct TextureVideoModel: TextureCellModel {
    let title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.systemFont(ofSize: 19, weight: .medium)])
	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
	let videoURL: URL = Bundle.main.url(forResource: "beach", withExtension: "mp4")!
}
