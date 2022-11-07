//
//  TextureTextModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//

import Foundation
import LoremIpsum

struct TextureAdModel: TextureCellModel {
    let title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.systemFont(ofSize: 19, weight: .medium)])
	let description = NSAttributedString(string: LoremIpsum.paragraph, attributes: [.font: UIFont.systemFont(ofSize: 17)])
	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
}
