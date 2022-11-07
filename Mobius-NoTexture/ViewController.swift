//
//  ViewController.swift
//  Mobius-NoTexture
//
//  Created by m.daudov on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: LayoutLifecycleCollectionView!
    private var models: [ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController {
    func getModel(for index: Int) -> ViewModel {
        switch index % 5 {
//        case 0: return ProductModel()
//        case 1: return AdModel()
//        case 2: return LottieModel()
//        case 3: return MultiimageModel()
//        case 4: return VideoModel()
        default: return ProductModel()
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: ViewModel
        if models.count <= indexPath.row {
            model = getModel(for: indexPath.row)
            models.append(model)
        } else {
            model = models[indexPath.row]
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.id, for: indexPath) as? Cell
        cell?.configure(with: model)
        return cell as! UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let model: ViewModel
        if models.count <= indexPath.row {
            model = getModel(for: indexPath.row)
//            models.append(model)
        } else {
            model = models[indexPath.row]
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.id, for: indexPath) as? DisplayControllCell
        cell?.willDisplay(model: model)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let model: ViewModel
        if models.count <= indexPath.row {
            model = getModel(for: indexPath.row)
            models.append(model)
        } else {
            model = models[indexPath.row]
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.id, for: indexPath) as? DisplayControllCell
        cell?.endDisplay()
    }
}



