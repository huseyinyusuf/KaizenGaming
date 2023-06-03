//
//  SportsViewMode.swift
//  KaizenGamingAssignment
//
//  Created by Huseyin Yusuf on 3/6/23.
//

import Foundation

final class SportsViewModel {
    
    private var items = [[1], [1], [1]]
    private var hidenSections = Set<Int>()
    
    func numberOfSections() -> Int {
        return items.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if (isSectionHidden(section: section)) {
            return 0
        } else {
            return items[section].count
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
        
        for row in  0..<items[section].count {
            indexPaths.append(IndexPath(row: row, section: section))
        }
        
        return indexPaths
    }
    
}
