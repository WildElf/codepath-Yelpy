//
//  BusinessCell.swift
//  Yelp
//
//  Created by Eric Zim on 2/2/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

	@IBOutlet weak var posterImage: UIImageView!
	@IBOutlet weak var ratingsImage: UIImageView!
	
	@IBOutlet weak var businessLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var ratingsLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var categoriesLabel: UILabel!


	var business: Business! {
		didSet {

			if (business.imageURL != nil) {
			posterImage.setImageWithURL(business.imageURL!)
			} else {
				let imageURL = NSURL(fileURLWithPath: "imageFail.png")
				ratingsImage.setImageWithURL(imageURL)
			}
			ratingsImage.setImageWithURL(business.ratingImageURL!)
			
			businessLabel.text = business.name
			distanceLabel.text = business.distance
			ratingsLabel.text = "\(business.reviewCount!) reviews"
			addressLabel.text = business.address
			categoriesLabel.text = business.categories
			
			priceLabel.text = "$$"
			
			
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		posterImage.layer.cornerRadius = 4
		posterImage.clipsToBounds = true
		
//		businessLabel.preferredMaxLayoutWidth = businessLabel.frame.width
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
//		businessLabel.preferredMaxLayoutWidth = businessLabel.frame.width
		
	}

}
