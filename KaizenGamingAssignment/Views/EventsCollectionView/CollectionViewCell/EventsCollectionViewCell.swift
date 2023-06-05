//
//  EventsCollectionViewCell.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

protocol CollectionCellelegate: AnyObject {
    func favouriteButtonPressed(event:Event?)
}

class EventsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var countDownView: UIView!
    @IBOutlet weak var competitor1Label: UILabel!
    @IBOutlet weak var competitor2Label: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    // MARK: - Properties -
    weak var delegate: CollectionCellelegate?
    private(set) var event: Event?
    private var timer: Timer?
    static var nib:UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return "eventCollectionViewCell"
    }
    
    // MARK: - Overrides -
    override func prepareForReuse() {
        // Reset timer for reused cell
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Public Methods -
    func configureCell(event: Event) {
        self.event = event
        // Competitors
        competitor1Label.textColor = UIColor(red: 0.73, green: 0.74, blue: 0.75, alpha: 1.00)
        competitor2Label.textColor = UIColor(red: 0.73, green: 0.74, blue: 0.75, alpha: 1.00)
        competitor1Label.text = event.competitor1
        competitor2Label.text = event.competitor2
        
        // CountDownView
        countDownView.layer.borderColor = UIColor(red: 0.40, green: 0.42, blue: 0.45, alpha: 1.00).cgColor
        countDownView.layer.borderWidth = 2
        countDownView.layer.cornerRadius = 6
        
        // CountDownText
        countDownLabel.textColor = UIColor(red: 0.40, green: 0.42, blue: 0.45, alpha: 1.00)
        countDownLabel.text = Countdown.shared.getCountdownStringFromTT(eventStartTime: event.startTime)
        
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.countDownLabel.text = Countdown.shared.getCountdownStringFromTT(eventStartTime: event.startTime)
        }
        // FavouriteButton
        favouriteButton.clipsToBounds = true
        favouriteButton.contentMode = .scaleAspectFit
        
        if (event.isFavourite) {
            favouriteButton.setImage(UIImage(named: "star-filled"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage(named: "star-empty"), for: .normal)
        }
        
    }
    
    // MARK: - Button Actions -
    @IBAction func favouriteButtonPressed(_ sender: Any) {
        delegate?.favouriteButtonPressed(event: self.event)
    }
}
