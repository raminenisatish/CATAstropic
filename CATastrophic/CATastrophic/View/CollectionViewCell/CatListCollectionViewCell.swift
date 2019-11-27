//
//  CatListCollectionViewCell.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 26/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import UIKit
import SDWebImage

class CatListCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var catImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }
  
  func update(with catInfo: CatList) {
    debugPrint(catInfo.url)
    self.catImageView.sd_setImage(with: URL(string: catInfo.url), placeholderImage:#imageLiteral(resourceName: "cat_paw.pdf"))
    
  }
}
