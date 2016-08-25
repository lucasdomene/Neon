//
//  String+Ext.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

extension String {
    
    func formattedMoneyAmount() -> Double {
        let valueString = self.stringByReplacingOccurrencesOfString("R$ ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return Double(valueString) ?? 0.0
    }
    
    func formattedDate() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        if dateFormatter.dateFromString(self) == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        }
        
        guard let date = dateFormatter.dateFromString(self) else {
            return ""
        }
        
        let calendar = NSCalendar.currentCalendar()
        calendar.locale = NSLocale(localeIdentifier: "pt_BR")
        let month = calendar.component(.Month, fromDate: date)

        dateFormatter.dateFormat = "dd 'de \(calendar.monthSymbols[month - 1].capitalizedString) de' yyyy - 'às' HH'h'mm"
        
        let formattedDate = dateFormatter.stringFromDate(date)
        return formattedDate
    }
}

