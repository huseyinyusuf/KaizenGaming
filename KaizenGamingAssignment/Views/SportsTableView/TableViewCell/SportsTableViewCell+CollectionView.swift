//
//  SportsTableViewCell+CollectionView.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

// MARK: - Collection View Methods -
extension SportsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.reuseIdentifier, for: indexPath) as? EventsCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.configureCell(event: self.events[indexPath.item])
        cell.delegate = self

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Customize cell width according to charecter size
        let event = self.events[indexPath.item]
        let maxCompetitorCharecterCount = max(event.competitor1.count, event.competitor2.count)
        switch (maxCompetitorCharecterCount) {
            case 0 ..< 10:
                return CGSize(width: 80, height: 130)
            case 10 ..< 16:
                return CGSize(width: 80 + ( 28 / (16 - maxCompetitorCharecterCount)), height: 130)
            default:
                return CGSize(width: 108, height: 130)
        }
    }
    
}

// MARK: - Delegate extensions -
extension SportsTableViewCell: CollectionCellelegate {
    
    func favouriteButtonPressed(event: Event?) {
        delegate?.updateViewModelEvent(event: event)
        self.eventsCollectionView.reloadData()
    }
    
}
