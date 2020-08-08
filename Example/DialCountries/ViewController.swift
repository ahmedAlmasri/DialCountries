//
//  ViewController.swift
//  DialCountries
//
//  Created by ahmed.almasri@ymail.com on 06/07/2020.
//  Copyright (c) 2020 ahmed.almasri@ymail.com. All rights reserved.
//

import UIKit
import DialCountries
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		DispatchQueue.main.async {
			
			let cv = DialCountriesController(locale: Locale(identifier: "ar"))
			cv.delegate = self
			cv.show(vc: self)
		}
		
    }

}

extension ViewController: DialCountriesControllerDelegate {
	func didSelected(with country: Country) {
		print(country)
	}
	
	
}

