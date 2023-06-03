//
//  SportsTableViewCell.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 2/6/23.
//

import UIKit

class SportsTableViewCell: UITableViewCell {
    @IBOutlet var eventsCollectionView: UICollectionView!
    
    static var nib:UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "sportCellIdentifier"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Init delegate methods for collectionView
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        
        // Register collectionview reusable cell
        eventsCollectionView.register(EventsCollectionViewCell.nib, forCellWithReuseIdentifier: EventsCollectionViewCell.reuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

