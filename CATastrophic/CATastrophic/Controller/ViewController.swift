//
//  ViewController.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
  
  // MARK: - Properties
  @IBOutlet weak var catlistCollectionView: UICollectionView!
  lazy var viewModel = CatListViewModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionViewSetups()
    fetchCatlistData()
  }
  
  override func viewModelObject() -> BaseViewModel? {
    return self.viewModel
  }
  
  func fetchCatlistData() {
    self.viewModel.fetchCatList()
  }
  
  override func setUpViewModelCallBacks() {
    let viewModel = viewModelObject() as! CatListViewModel
    viewModel.requestSucceded = {[weak self] count in
      self?.catlistCollectionView.reloadData()
    }
  }
  fileprivate func collectionViewSetups() {
  self.catlistCollectionView.register(NibFiles.CatListCollectionViewCell.instance, forCellWithReuseIdentifier: CatListCollectionViewCell.identifier)
    self.catlistCollectionView.delegate = self
    self.catlistCollectionView.dataSource = self
        if #available(iOS 13.0, *) {
          catlistCollectionView.collectionViewLayout = createCatListLayout()
        }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     if self.shouldLoadMore() {
       self.viewModel.fetchCatList()
     }
   }
   
   func shouldLoadMore() -> Bool {
     return ((catlistCollectionView.contentOffset.y + catlistCollectionView.frame.size.height) >= catlistCollectionView.contentSize.height)
   }
  
}

extension ViewController: UICollectionViewDelegateFlowLayout ,UICollectionViewDelegate,UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.catlist.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatListCollectionViewCell.identifier, for: indexPath) as! CatListCollectionViewCell
    cell.update(with: viewModel.catlist[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
    let viewWidth = catlistCollectionView.bounds.width
    return CGSize(width: viewWidth / 3 , height: viewWidth / 3 )
     
   }
  
}


extension ViewController {
  @available(iOS 13.0, *)
  func createCatListLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(1/3))
    
    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3))
    
    let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
    
    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
   
    
    let layout = UICollectionViewCompositionalLayout(section: layoutSection)
    
    return layout
  }
}
