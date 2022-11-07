//
//  CellModel.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit
import LoremIpsum
import Lottie

protocol Cell: AnyObject {
    func configure(with model: ViewModel)
}

protocol DisplayControllCell {
    func willDisplay(model: ViewModel)
    func endDisplay()
}

extension DisplayControllCell {
    func willDisplay(model: ViewModel) { }
    func endDisplay() { } 
}

protocol ViewModel {
    var id: String { get }
}

struct ProductModel: ViewModel {
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

struct AdModel: ViewModel {
    let id: String = "AdCell"
    
    let title: String
    let text: String
    let avatarName: String?
    
    init() {
        title = LoremIpsum.title
        text = LoremIpsum.sentences(withNumber: (1...6).randomElement() ?? 2)
        avatarName = nil
    }
}

struct LottieModel: ViewModel {
    let id: String = "LottieCell"
    
    let title: String
    let animation: Animation
    
    init() {
        title = LoremIpsum.title
        
        let animName = Bundle.main.path(forResource: "assistant", ofType: "json") ?? ""
        let url = URL(fileURLWithPath: animName)
        let data = try! Data(contentsOf: url)
        let file = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
        animation = try! Animation(dictionary: file)
    }
}

struct MultiimageModel: ViewModel {
    let id: String = "MultiimageCell"
    
    let title: String
    let images: [String]
    
    init() {
        title = LoremIpsum.sentence
        images = ["", "", "", ""]
    }
}

struct VideoModel: ViewModel {
    let id: String = "VideoCell"
    
    let title: String
    let video: String
    
    init() {
        title = LoremIpsum.title
        video = Bundle.main.path(forResource: "beach", ofType: "mp4") ?? ""
    }
}

