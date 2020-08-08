//
//  String+Numbers.swift
//  DialCountries
//
//  Created by Ahmad Almasri on 8/8/20.
//

import Foundation

extension String {
	
	func toEnglishNumber() -> String {
		let numberFormatter = NumberFormatter()
		numberFormatter.locale = Locale(identifier: "EN")
		guard let result = numberFormatter.number(from: self) else {
			
			return self
		}
		return result.stringValue
	}
}
