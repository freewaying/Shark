//
//  CountedSet.swift
//  SharkCommandLine
//
//  Created by Kaan Dedeoglu on 10/14/15.
//  Copyright © 2015 Kaan Dedeoglu. All rights reserved.
//

import Foundation

struct CountedSet<Element: Hashable>: SequenceType {
    private var backingDictionary = [Element : Int]()
        
    mutating func addObject(object: Element) -> Int {
        let currentCount = backingDictionary[object] ?? 0
        let newCount = currentCount + 1
        backingDictionary[object] = newCount
        return newCount
    }
    
    mutating func removeObject(object: Element) -> Int {
        if let currentCount = backingDictionary[object] where currentCount > 0 {
            let newCount = currentCount - 1
            if newCount == 0 {
                backingDictionary.removeValueForKey(object)
            } else {
                backingDictionary[object] = newCount
            }
            return newCount
        }
        
        fatalError("We should never keep an element with 0 count")
    }
    
    func countForObject(object: Element) -> Int {
        return backingDictionary[object] ?? 0
    }
    
    func contains(object: Element) -> Bool {
        return backingDictionary.keys.contains(object)
    }
    
    func generate() -> DictionaryGenerator<Element, Int> {
        return backingDictionary.generate()
    }
}






