//
//  WalletView.swift
//  WalletView
//
//  Created by keisme on 2018/3/15.
//  Copyright © 2018年 keisme. All rights reserved.
//

import UIKit

class WalletView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initConfig()
    }
    
}

extension WalletView {
    private func initConfig() {
        loadNib()
//        collectionView.backgroundColor = UIColor.blue
        collectionView.register(UINib.init(nibName: "WalletCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WalletCollectionViewCell")
        let layout = WalletLayout()
        collectionView.collectionViewLayout = layout
    }
    
    private func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        let contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        contentView.frame = bounds
        addSubview(contentView)
    }
}

extension WalletView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalletCollectionViewCell", for: indexPath) as! WalletCollectionViewCell
        
        return cell
    }

}

// MARK: - Collection view delegate
extension WalletView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)
//        collectionView.isScrollEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)
//        collectionView.isScrollEnabled = true
    }
    
}


