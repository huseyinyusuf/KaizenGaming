//
//  SportsViewMode.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func shouldReloadTableView()
}

final class SportsViewModel {
    
    // MARK: - Properties -
    weak var delegate: ViewModelDelegate?
    private var sports: [Sport] = []
    private var hidenSections = Set<Int>()
    
    // MARK: - Initializers -
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
        fetchDataFromInternet()
    }
    // MARK: - Public Methods -
    func numberOfSections() -> Int {
        return sports.count
    }
    
    func getSportWithSection(section: Int) -> Sport? {
        return sports[section]
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (isSectionHidden(section: section)) {
            return 0
        } else {
            return 1
        }
    }
    
    // Return a bool value accroding section hiden information
    func isSectionHidden(section: Int) -> Bool {
        if (hidenSections.contains(section)) {
            return true
        } else {
            return false
        }
    }
        
    func removeSectionFromHidenSections(section: Int) {
        hidenSections.remove(section)
    }
    
    func addSectionToHidenSections(section:Int) {
        hidenSections.insert(section)
    }
    
    // Indexpath helper
    func indexPathsForSection(section: Int) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        
        for row in  0..<1 {
            indexPaths.append(IndexPath(row: row, section: section))
        }
        
        return indexPaths
    }
    
    func updateSportsWithEvent(event: Event?) {
        for (sportIndex, sport) in sports.enumerated(){
            if (event?.sportId == sport.sportId) {
                for (eventIndex, sportEvent) in sport.events.enumerated() {
                    if (event?.eventId == sportEvent.eventId) {
                        // Change favourite
                        sports[sportIndex].events[eventIndex].isFavourite.toggle()
                        // Sort with favourites 1st
                        sortEventsWithFavouriteFirst(sportIndex: sportIndex)
                    }
                }
            }
        }
    }
    
    // MARK: - Private Methods -
    private func sortEventsWithFavouriteFirst(sportIndex: Int) {
        sports[sportIndex].events = sports[sportIndex].events.sorted{ $0.isFavourite && !$1.isFavourite }
    }
    
    private func fetchDataFromInternet() {
        NetworkManager.shared.fetchSportsData { [weak self] (sportsJsonArray, error) in
            guard let jsonArray = sportsJsonArray else { return }
            for json in jsonArray {
                let sport = Sport(json: json)
                self?.sports.append(sport)
                self?.delegate?.shouldReloadTableView()
            }
        }
    }
    
}
