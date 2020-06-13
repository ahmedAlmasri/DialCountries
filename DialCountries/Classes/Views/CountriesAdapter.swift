//
//  CountriesAdapter.swift
//  DialCountries
//
//  Created by Ahmad Almasri on 6/9/20.
//

import UIKit

protocol CountriesAdapterDelegate: AnyObject {
	func didSelected(with country: Country)
}

class CountriesAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
	var items: [Country]
	weak var delegate: CountriesAdapterDelegate?
	
	init(items: [Country], delegate: CountriesAdapterDelegate) {
		self.items = items
		self.delegate = delegate
	}
	
	func update(items: [Country]) {
		self.items = items
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let item = items[indexPath.row]
		
		let cell = UITableViewCell(style: .value1, reuseIdentifier: "\(indexPath.section)")
		
		cell.textLabel?.text = item.title
		cell.detailTextLabel?.text = item.dialCode
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = items[indexPath.row]
		self.delegate?.didSelected(with: item)
	}
}
