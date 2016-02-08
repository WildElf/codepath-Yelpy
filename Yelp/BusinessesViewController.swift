//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	
	var searchBar: UISearchBar!
	
	var businesses: [Business]!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		searchBar = UISearchBar()

		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 150
		
		searchBar.delegate = self
		searchBar.sizeToFit()
		
		navigationItem.titleView = searchBar
		
		/* Example of Yelp search with more search options specified
		Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
		self.businesses = businesses
		
		for business in businesses {
		print(business.name!)
		print(business.address!)
		}
		}
		*/
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if businesses != nil {
			return businesses.count
		}
		else
		{
			return 0
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
		
		cell.business = businesses[indexPath.row]
		
		return cell
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func yelpLoad (searchText: String) {
		
		Business.searchWithTerm(searchText, completion: { (businesses: [Business]!, error: NSError!) -> Void in
			self.businesses = businesses
			self.tableView.reloadData()
			
			for business in businesses {
				print(business.name!)
				print(business.address!)
			}
		})
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		
			yelpLoad(searchText)
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		searchBar.becomeFirstResponder()
	}
	
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.showsCancelButton = true
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.showsCancelButton = false
		searchBar.text = ""
		searchBar.resignFirstResponder()
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
