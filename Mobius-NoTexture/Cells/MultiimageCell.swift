//
//  MultiimageCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import Foundation

//
//  LottieCell.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 08.10.2022.
//

import UIKit

final class MultiimageCell: UICollectionViewCell, Cell {
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    private var model: MultiimageModel?
    private var timer: Timer?
    private var currentScrolled = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardView.layer.shadowOpacity = 0.6
        cardView.layer.shadowColor = UIColor.darkGray.cgColor
        cardView.layer.masksToBounds = false
        
        // FIXME: Blend shadow
//        let imageView = cardCornerImage(size: cardView.bounds.size)
//        cardView.insertSubview(imageView, at: 0)
//
//        NSLayoutConstraint.activate([
//            imageView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
//            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
//        ])
        
        
        // FIXME: Blend
//        titleLabel.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with model: ViewModel) {
        guard let model = model as? MultiimageModel else {
            fatalError("Wrong model for MultiimageCell: \(model.self)")
        }
        
        titleLabel.text = model.title
        self.model = model
        currentScrolled = 0
        
        galleryCollectionView.reloadData()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(scrollNext), userInfo: nil, repeats: true)
        
    }
    
    @objc
    private func scrollNext() {
        currentScrolled = currentScrolled == 3 ? 0 : currentScrolled + 1
        galleryCollectionView.scrollToItem(at: IndexPath(row: currentScrolled, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
    }
}

extension MultiimageCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? GalleryCell
        
        if let image = model?.images[indexPath.row] {
            cell?.configure(with: image)
        }
        
        return cell!
        
    }
}
