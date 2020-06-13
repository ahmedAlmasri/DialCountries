//
//  CountriesFetcher.swift
//  DialCountries
//
//  Created by Ahmad Almasri on 6/7/20.
//

import Foundation

class CountriesFetcher {
	
	func fetch() -> [Country] {
		
		let url = BundleLoader.getBundle().url(forResource: "countries", withExtension: "json")
		let data = try! Data(contentsOf: url!)
		
		let decoder = JSONDecoder()
		
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let countries = try! decoder.decode([Country].self, from: data)
		
		return countries
		
	}
	
	
}
