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
    let vm = SportsViewModel()
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    // MARK: Sections Configuration
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm.numberOfSections()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderUIView()
        headerView.initHeaderSection(section: section, isHidden: vm.isSectionHidden(section: section))
        headerView.delegate = self
        return headerView
    }
    
}

extension MainViewController: HeaderDelegate {
    
    func didClickExtendCollapseButton(section: Int?) {
        guard let section = section else { return }
        
        if (vm.isSectionHidden(section: section)) {
            vm.removeSectionFromHidenSections(section: section)
            sportsTableView.insertRows(at: vm.indexPathsForSection(section: section),
                                       with: .fade)
        } else {
            vm.addSectionToHidenSections(section: section)
            sportsTableView.deleteRows(at: vm.indexPathsForSection(section: section),
                                       with: .fade)
        }
        
        // Reload related section only instead of reloading all tableview
        let indexSet = IndexSet(integer: section)
        sportsTableView.reloadSections(indexSet, with: .none)
    }
}

