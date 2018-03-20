//
//  WalletCollectionViewCell.swift
//  WalletView
//
//  Created by keisme on 2018/3/15.
//  Copyright © 2018年 keisme. All rights reserved.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {

    var isExpand = false
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
        bgView.layer.cornerRadius = 8.0
    }

}
