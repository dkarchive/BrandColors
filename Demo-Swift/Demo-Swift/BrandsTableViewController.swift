//
//  BrandsTableViewController.swift
//  Demo-Swift
//
//  Created by Daniel on 6/25/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

import UIKit

class BrandsTableViewController: UITableViewController {
    
    let dataSource:NSArray = UIColor.bc_brands()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Brand Colors"
        
        self.tableView.rowHeight = 54
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        println("BrandColors contains \(UIColor.bc_brands().count) brands: \(UIColor.bc_brands())")
        println("BrandColors also has a list of brands with a light color: \(UIColor.bc_brandsWithLightColor())")
    }
    
    // #MARK: - Table view data source
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as UITableViewCell
        
        let brand = self.dataSource[indexPath.row] as String
        
        cell.textLabel?.text = "\(brand)"
        cell.backgroundColor = UIColor.bc_colorForBrand(brand)
        
        let array:[String] = UIColor.bc_brandsWithLightColor() as [String]
        cell.textLabel?.textColor = contains(array,brand) ? UIColor.blackColor() : UIColor.whiteColor()
        
        return cell
    }
}
