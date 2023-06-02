//
//  ViewController.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 1/6/23.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set up at first load
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        // Setup navigation bar title
        setupNavigationBarTitle()
    }
    
    private func setupNavigationBarTitle() {
        let titleImage = UIImage(named: "kaizen_gaming_navbar")
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
    }
    
    
    // MARK: - Navigation Bar Actions
    @IBAction func porfileButtonAction(_ sender: Any) {
        // Profile button action should be implemented here
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        // Settings button action should be implemented here
    }
}

