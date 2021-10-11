//
//  Date.swift
//  App06-TODO-Firebase
//
//  Created by David Josué Marcial Quero on 11/10/21.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
