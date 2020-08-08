//
//  DialCountriesController.swift
//  DialCountries
//
//  Created by Ahmad Almasri on 6/7/20.
//

import UIKit

public protocol DialCountriesControllerDelegate: AnyObject {
	
	func didSelected(with country: Country)
}

public class DialCountriesController: UITableViewController, UISearchResultsUpdating {
	
	private let fetcher = CountriesFetcher()
	private var countryList = [Country]()
	private var countryFilter = [Country]()
	public weak var delegate: DialCountriesControllerDelegate?
	private let searchController = UISearchController(searchResultsController: nil)
	private var adapter: CountriesAdapter!
	
	public init(locale: Locale) {
		Config.localIdentifier = locale
		super.init(nibName: nil, bundle: nil)
	}
	
	public func show(vc: UIViewController) {
		let nav = UINavigationController(rootViewController: self)
		vc.present(nav, animated: true, completion: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		
		countryList = fetcher.fetch()
		countryFilter = countryList
		
		setupTableView()
		setupSearchController()
		
	}
	
	private func setupTableView() {
		adapter = CountriesAdapter(items: countryFilter, delegate: self)
		self.tableView.delegate = adapter
		self.tableView.dataSource = adapter
	}
	
	private func setupSearchController() {
		
		searchController.searchResultsUpdater = self
		searchController.hidesNavigationBarDuringPresentation = false
		searchController.obscuresBackgroundDuringPresentation = false
		self.navigationItem.titleView = self.searchController.searchBar
		definesPresentationContext = true
		
	}
	
	public func updateSearchResults(for searchController: UISearchController) {
		if let searchText = searchController.searchBar.text, !searchText.isEmpty {
			countryFilter = countryList.filter { country in
				return country.name.lowercased().contains(searchText.lowercased()) || (country.dialCode?.contains(searchText.toEnglishNumber()) == true) || country.code.lowercased().contains(searchText.lowercased())
			}
			
			
		} else {
			countryFilter = countryList
		}
		adapter.update(items: countryFilter)
		tableView.reloadData()
	}
}

extension DialCountriesController: CountriesAdapterDelegate {
	
	func didSelected(with country: Country) {
		self.delegate?.didSelected(with: country)
		searchController.dismiss(animated: true, completion: nil)
		self.dismiss(animated: true, completion: nil)
	}
	
}
