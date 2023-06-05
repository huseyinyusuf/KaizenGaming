//
//  SportsTableViewCell.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 2/6/23.
//

import UIKit

protocol ViewModelUpdateDelegate: AnyObject {
    func updateViewModelEvent(event:Event?)
}

class SportsTableViewCell: UITableViewCell {
    // MARK: - Outlets -
    @IBOutlet var eventsCollectionView: UICollectionView!
    
    // MARK: - Variables -
    private(set) var events: [Event] = []
    private(set) var section: Int = 0
    private(set) var sport: Sport?
    
    weak var delegate: ViewModelUpdateDelegate?
    
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
    
    // MARK: - Public methods -
    func configureSportsTableViewCell(sport: Sport, section: Int) {
        self.sport = sport
        self.events = sport.events
        self.section = section
        
        self.eventsCollectionView.reloadData()
    }
    
}

