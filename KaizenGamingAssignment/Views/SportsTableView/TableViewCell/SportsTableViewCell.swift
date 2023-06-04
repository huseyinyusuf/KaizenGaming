//
//  SportsTableViewCell.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 2/6/23.
//

import UIKit

class SportsTableViewCell: UITableViewCell {
    // MARK: - Outlets -
    @IBOutlet var eventsCollectionView: UICollectionView!
    
    // MARK: - Variables -
    private(set) var sport: Sport?
    private(set) var event = "Manchester United"
    
    static var nib:UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "sportCellIdentifier"
    }

    // MARK: - Overrides -
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Init delegate methods for collectionView
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        
        // Register collectionview reusable cell
        eventsCollectionView.register(EventsCollectionViewCell.nib, forCellWithReuseIdentifier: EventsCollectionViewCell.reuseIdentifier)
    }
    
    // MARK: - Private methods -
    func configureCell(sport: Sport?) {
        self.sport = sport
    }
    
}

