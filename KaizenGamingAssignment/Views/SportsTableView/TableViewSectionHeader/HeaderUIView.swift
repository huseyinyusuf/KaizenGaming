//
//  HeaderUIView.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

// ENUM For Sport Icon
enum SportNameIcon : CustomStringConvertible {
    case FOOT
    case BASK
    case TENN
    case TABL
    case ESPS
    case HAND
    case BCHV
    case NONE
    
    var description: String {
        switch self {
            case .FOOT: return "⚽"
            case .BASK: return "🏀"
            case .TENN: return "🎾"
            case .TABL: return "🏓"
            case .ESPS: return "🎮"
            case .HAND: return "🤾"
            case .BCHV: return "🏖"
            case .NONE: return ""
        }
    }
    
    init (id: String) {
        switch (id) {
            case "FOOT": self = .FOOT
            case "BASK": self = .BASK
            case "TENN": self = .TENN
            case "TABL": self = .TABL
            case "ESPS": self = .ESPS
            case "HAND": self = .HAND
            case "BCHV": self = .BCHV
            default:
                self = .NONE
        }
    }
}

protocol HeaderDelegate: AnyObject {
    func didClickExtendCollapseButton(section:Int?)
}

class HeaderUIView: UIView {
    // MARK: - Outlets -
    @IBOutlet weak private var sportName: UILabel!
    @IBOutlet weak private var extendCollapseButton: UIButton!
    @IBOutlet weak private var contentView: UIView!
    
    // MARK: - Properties
    weak var delegate: HeaderDelegate?
    private var section: Int?
    private var isSectionHidden: Bool?
    
    // MARK: - Init Methods -
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    // MARK: - Private Methods -
    private func loadFromNib() {
        Bundle.main.loadNibNamed("HeaderUIView", owner: self, options: nil)
        addSubview(contentView)
        
        // Autoresizing contentView
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func sportNameWithIcon(sport: Sport?) -> String {
        guard let sport = sport else { return "" }
        let fullSportNameWithIcon = SportNameIcon(id: sport.sportId).description + " " + sport.sportName
        return fullSportNameWithIcon
    }
    
    // MARK: - Public Methods -
    func configureHeaderView(sport: Sport?, section: Int, isHidden: Bool) {
        self.section = section
        self.isSectionHidden = isHidden
        
        // Sport name
        sportName.text = sportNameWithIcon(sport: sport)
        
        // Extend|Collapse Button
        extendCollapseButton.clipsToBounds = true
        extendCollapseButton.contentMode = .scaleAspectFit
        
        if (isSectionHidden ?? false) {
            extendCollapseButton.setImage(UIImage(named: "down-arrow"), for: .normal)
        } else {
            extendCollapseButton.setImage(UIImage(named: "up-arrow"), for: .normal)
        }
    }
    
    // MARK: - Outlet Actions -
    @IBAction func extendCollapseAction(_ sender: Any) {
        delegate?.didClickExtendCollapseButton(section: section)
    }
}
