//
//  SportsTableViewCell+CollectionView.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

extension SportsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.reuseIdentifier, for: indexPath) as? EventsCollectionViewCell ?? UICollectionViewCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Customize cell width according to charecter size
        let maxCompetitorCharecterCount = self.event.count
        switch (maxCompetitorCharecterCount) {
            case 0 ..< 10:
                return CGSize(width: 80, height: 130)
            case 10 ..< 16:
                return CGSize(width: maxCompetitorCharecterCount * 9, height: 130)
            default:
                return CGSize(width: 108, height: 130)
        }
    }

    
}
