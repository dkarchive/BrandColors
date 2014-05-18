//
//  DKTableViewController.m
//  Demo
//
//  Created by Daniel on 5/2/14.
//  Copyright (c) 2014 dkhamsing. All rights reserved.
//

#import "DKTableViewController.h"
#import "UIColor+BrandColors.h"

@interface DKTableViewController ()
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation DKTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.dataSource = [UIColor bc_brands];
        self.title = @"Brand Colors";
        self.tableView.rowHeight = 54;
        
        NSLog(@"BrandColors contains %@ brands:%@", @([UIColor bc_brands].count),[UIColor bc_brands]);
        
        NSLog(@"BrandColors also has a list of brands with dark color:%@", [UIColor bc_brandsWithDarkColor]);
    }
    return self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    // Return the number of rows in the section.
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
        cell.separatorInset = UIEdgeInsetsZero;
    }
    NSString *brand = self.dataSource[indexPath.row];

    cell.textLabel.text = brand;
    cell.backgroundColor = [UIColor bc_colorForBrand:brand];
    
    if ([[UIColor bc_brandsWithDarkColor] containsObject:brand]) {
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

@end
