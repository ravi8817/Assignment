//
//  AboutTableViewCell.swift
//  Assignment
//
//  Created by Ravi Patel on 07/10/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit
import Kingfisher

class AboutTableViewCell: UITableViewCell {
    
    //Initializing Date Label
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "TextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Initializing Detail Label
    let detailLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "TextColor")
        label.numberOfLines = 0 // Setting max number of lines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Initializing ImageView
    let feedImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.layer.cornerRadius = 5 //Making Image circular corner
        img.clipsToBounds = true //So that it will not overflow
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    //Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(feedImageView)
        setupTitleConstraint()
        setupDetailLabelConstraint()
        setupImageViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     This function used for setting date label layout
     */
    func setupTitleConstraint(){
        let marginGuide = contentView.layoutMarginsGuide
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 5).isActive = true
    }
    /**
     This function used for setting detail label layout
     */
    func setupDetailLabelConstraint(){
        let marginGuide = contentView.layoutMarginsGuide
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    /**
     This function used for setting ImageView layout
     */
    func setupImageViewConstraint(){
        let marginGuide = contentView.layoutMarginsGuide
        feedImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        feedImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        feedImageView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 5).isActive = true
        feedImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 5).isActive = true
        feedImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    /**
     This function used for configuring tableView cell
     - Parameters:
     - feed: FeedData to configure cell
     */
    func loadCell(about: About){
        //Checking Feed have date or not to avoid crash
        if let title = about.title {
            titleLabel.text = title
        }
        //Checking Feed have detail data or not to avoid crash
        if let description = about.rowDescription {
            detailLabel.text = description
        }
        
        //Checking Feed have Image or not to avoid crash
        if let image = about.imageHref {
            feedImageView.kf.indicatorType = .activity
            feedImageView.kf.setImage(with: URL(string: image))
        }
    }
    
}

