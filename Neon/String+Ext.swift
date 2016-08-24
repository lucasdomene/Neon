//
//  String+Ext.swift
//  Neon
//
//  Created by Lucas Domene Firmo on 8/24/16.
//  Copyright © 2016 Domene. All rights reserved.
//

import Foundation

extension String {
    
    func formatedMoneyAmount() -> Double {
        let valueString = self.stringByReplacingOccurrencesOfString("R$ ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return Double(valueString) ?? 0.0
    }

}

