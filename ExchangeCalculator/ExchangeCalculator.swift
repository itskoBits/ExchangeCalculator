//
//  ExchangeCalculator.swift
//  ExchangeCalculator
//
//  Created by Ivelin Davidov on 21.01.19.
//  Copyright © 2019 Ivelin Davidov. All rights reserved.
//

import Foundation

class ExchangeCalculator {
    
    let exchangeRate: Decimal = 3582.75
    
    func getBtcAmount(usdAmount: Decimal) -> Decimal {
        let btcAmount = usdAmount / exchangeRate
        return btcAmount
    }
    
}
