//
//  ViewController.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 1/6/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Outlets -
    @IBOutlet var sportsTableView: UITableView!
    
    // MARK: - View Controller Override methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    // MARK: - Private methods -
    
    // MARK: Initial configuration for viewController
    private func setup() {
        // Setup navigation bar title
        setupNavigationBarTitle()
        
        // Register tableview Nibs
        registerNibs()
        
        // Init sportsTableView delegate and datasourse
        setupSportsTableView()
    }
    
    private func setupNavigationBarTitle() {
        let titleImage = UIImage(named: "kaizen_gaming_navbar")
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = titleImageView
    }
    
    private func registerNibs() {
        sportsTableView.register(SportsTableViewCell.nib, forCellReuseIdentifier: SportsTableViewCell.reuseIdentifier)
    }
    
    private func setupSportsTableView() {
        sportsTableView.delegate = self
        sportsTableView.dataSource = self
        
        // To avoid additional top spacing above section headers for ios 15 and above
        if #available(iOS 15.0, *) {
            sportsTableView.sectionHeaderTopPadding = 0.0
        }
    }
    
    // MARK: - Navigation Bar Actions
    @IBAction func profileButtonAction(_ sender: Any) {
        // Profile button action should be implemented here
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        // Settings button action should be implemented here
    }
}

// MARK: - Tableview DataSource and Delegate Methods -
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: Cell Configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCellIdentifier", for: indexPath) as? SportsTableViewCell ?? UITableViewCell()
        return cell
    }
    
    
    // MARK: Sections Configuration
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        view.backgroundColor = .systemBlue
        return view
        
//        let sectionButton = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
//        sectionButton.setTitle(String(section),
//                               for: .normal)
//        sectionButton.backgroundColor = .systemBlue
//        sectionButton.tag = section
//        sectionButton.addTarget(self,
//                                action: #selector(hideShowSection),
//                                for: .touchUpInside)
//        return sectionButton
    }
    
    @objc private func hideShowSection() {
        
    }
    
}

