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

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.dataSource = [UIColor bc_brands];
        self.title = @"Brand Colors";
        self.tableView.rowHeight = 54;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        NSLog(@"BrandColors contains %@ brands:%@", @([UIColor bc_brands].count),[UIColor bc_brands]);
        
        NSLog(@"BrandColors also has a list of brands with light color:%@", [UIColor bc_brandsWithLightColor]);
    }
    return self;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    NSString *brand = self.dataSource[indexPath.row];
    cell.backgroundColor = [UIColor bc_colorForBrand:brand];
    cell.textLabel.text = brand;
    cell.textLabel.textColor = ([[UIColor bc_brandsWithLightColor] containsObject:brand]) ? [UIColor blackColor]:[UIColor whiteColor];
    
    return cell;
}


@end
