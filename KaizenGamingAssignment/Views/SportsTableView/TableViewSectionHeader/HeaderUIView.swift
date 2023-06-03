//
//  HeaderUIView.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import UIKit

protocol HeaderDelegate: AnyObject {
    func didClickExtendCollapseButton(section:Int?)
}

class HeaderUIView: UIView {
    @IBOutlet weak private var sportImageView: UIImageView!
    @IBOutlet weak private var sportName: UILabel!
    @IBOutlet weak private var extendCollapseButton: UIButton!
    @IBOutlet weak private var contentView: UIView!
    
    weak var delegate: HeaderDelegate?
    var section: Int?
    var isSectionHidden: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    func loadFromNib() {
        Bundle.main.loadNibNamed("HeaderUIView", owner: self, options: nil)
        addSubview(contentView)
        
        // Autoresizing contentView
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func initHeaderSection(section: Int, isHidden: Bool) {
        self.section = section
        self.isSectionHidden = isHidden
        
        // Sport name
        sportName.text = "Football"
        
        // Sport Icon
        sportImageView.image = UIImage(named: "user")
        
        // Extend|Collapse Button
        extendCollapseButton.clipsToBounds = true
        extendCollapseButton.contentMode = .scaleAspectFit
        
        if (isSectionHidden ?? false) {
            extendCollapseButton.setImage(UIImage(named: "down-arrow"), for: .normal)
        } else {
            extendCollapseButton.setImage(UIImage(named: "up-arrow"), for: .normal)
        }
    }
    
    @IBAction func extendCollapseAction(_ sender: Any) {
        delegate?.didClickExtendCollapseButton(section: section)
    }
}
