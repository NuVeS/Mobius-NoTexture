//
//  TextureLottieModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 25.10.2022.
//


import Foundation
import LoremIpsum
import Lottie

struct TextureLottieModel: TextureCellModel {
	let title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.boldSystemFont(ofSize: 19)])
	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
    let animation: Animation = {
        let animName = Bundle.main.path(forResource: "assistant", ofType: "json") ?? ""
        let url = URL(fileURLWithPath: animName)
        let data = try! Data(contentsOf: url)
        let file = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
        return try! Animation(dictionary: file)
    }()
}
