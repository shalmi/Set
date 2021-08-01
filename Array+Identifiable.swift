//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Michael on 4/10/21.
//

import Foundation

extension Array where Element: Identifiable {
    func findIndex(of item: Element) -> Int? {
        for index in 0..<self.count {
            if item.id == self[index].id{
                return index
            }
        }
        return nil
    }
}
