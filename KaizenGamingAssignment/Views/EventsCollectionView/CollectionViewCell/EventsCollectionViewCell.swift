//
//  EventsCollectionViewCell.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var competitor1Label: UILabel!
    @IBOutlet weak var competitor2Label: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    // MARK: - Properties -
    static var nib:UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "eventCollectionViewCell"
    }
    
    // MARK: - Public Methods -
    func configureCell(event: Event) {
        // Competitors
        competitor1Label.text = event.competitor1
        competitor2Label.text = event.competitor2
    }

}
