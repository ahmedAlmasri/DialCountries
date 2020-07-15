//
//  Country.swift
//  DialCountries
//
//  Created by Ahmad Almasri on 6/9/20.
//

import Foundation

public struct Country: Decodable {
	var flag: String {
		
		return code
			.unicodeScalars
			.map({ 127397 + $0.value })
			.compactMap(UnicodeScalar.init)
			.map(String.init)
			.joined()
	}
	let code: String
	var name: String {
		Config.localIdentifier?.localizedString(forRegionCode: code) ?? ""
	}
	
	var title: String {
		
		String(format: "%@ %@", self.flag, self.name)
	}
	let dialCode: String?
	
	public static func getCurrentCountry() -> Country? {
		let locale: NSLocale = NSLocale.current as NSLocale
		let currentCode: String? = locale.countryCode
		return CountriesFetcher().fetch().first(where: { $0.code ==  currentCode})
	}
}
