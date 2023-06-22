//
//  DateExtension.swift
//  Blog App
//
//  Created by Fabio Avila Oliveira on 22/06/23.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZ"
        let formattedDate = dateFormatter.string(from: self)
        
        return formattedDate
    }
}

extension String {
    func formatDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZZ"

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "E dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
