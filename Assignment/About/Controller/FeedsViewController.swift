//
//  FeedsViewController.swift
//  Assignment
//
//  Created by Ravi Patel on 07/10/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var tableView: UITableView?
    private let refreshControl = UIRefreshControl()
    
    var feeds: AboutCanada?
    var viewModel = FeedsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up TableView
        setupUI()
        getAboutData()
        
        
    }
    
    @objc func getAboutData(){
        viewModel.getAboutCanada {[weak self] (feedData) in
            self?.feeds = feedData
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
                if let title = self?.feeds?.title{
                    self?.title = title
                }
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    /**
     This function used for setting UI of View
     */
    func setupUI() {
      
        view.backgroundColor = .white //Setting view background color
        
        tableView = UITableView()
        tableView?.allowsSelection = false
        tableView?.accessibilityIdentifier = "table--feedsTableView"
        view.addSubview(tableView!)
        tableView?.tableFooterView = UIView()
        tableView?.showsVerticalScrollIndicator = false
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        
        
        let marginGuide = view.layoutMarginsGuide
        tableView?.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        tableView?.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        tableView?.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        tableView?.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        view.layoutIfNeeded()
        
        //Register TableView Cell
        tableView?.register(AboutTableViewCell.self, forCellReuseIdentifier: "AboutCell")
        
        //Setting DataSource And Delegate
        tableView?.dataSource = self
        tableView?.delegate = self
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView?.refreshControl = refreshControl
        } else {
            tableView?.addSubview(refreshControl)
        }
        
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(getAboutData), for: .valueChanged)
        
        
    }
    
    
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return feeds?.rows.count ?? 0 // Return number of cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aboutData = feeds?.rows
        let about = aboutData![indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath) as! AboutTableViewCell
        cell.loadCell(about: about)
        return cell
    }
    
}
