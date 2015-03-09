//
//  ViewController.m
//  BrandColors
//
//  Created by Daniel Khamsing on 3/9/15.
//  Copyright (c) 2015 Daniel Khamsing. All rights reserved.
//

#import "ViewController.h"

// Defines
#import "Defines.h"

// Models
#import "BrandColor.h"

// Views
#import "BrandCell.h"

NSString *cacheKey = @"cacheKey1--";

static const NSInteger kNumberOfSecondsToLive = 60 * 5; // 5 minutes

@interface DataCache : NSObject <NSCoding>
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSDate *date;
+ (NSData *)cached;
@end

@implementation DataCache

+ (NSData *)cached {
    NSData *dataFromUserDefaults = [[NSUserDefaults standardUserDefaults] objectForKey:cacheKey];
    if (!dataFromUserDefaults)
        return nil;
    
    DataCache *cache = [NSKeyedUnarchiver unarchiveObjectWithData:dataFromUserDefaults];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond fromDate:cache.date toDate:[NSDate date] options:kNilOptions];
    
    if (components.second<kNumberOfSecondsToLive) {
        return cache.data;
    }
    
    return nil;
}

#pragma mark - NSCoding

NSString *k_data = @"k_data";
NSString *k_date = @"k_date";

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.data = [aDecoder decodeObjectForKey:k_data];
        self.date = [aDecoder decodeObjectForKey:k_date];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_data forKey:k_data];
    [aCoder encodeObject:_date forKey:k_date];
}

@end

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"BrandColors";
    
    self.tableView.rowHeight = 70;
    
    NSData *data = [DataCache cached];
    if (data) {
        [self displayData:data];
        return;
    }    
    
    NSURL *url = [NSURL URLWithString:bc_api_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"view controller something went wrong %@", connectionError.localizedDescription);
            return;
        }
        
        DataCache *cache = [[DataCache alloc] init];
        cache.data = data;
        cache.date = [NSDate date];
        
        NSData *data1 = [NSKeyedArchiver archivedDataWithRootObject:cache];
        [[NSUserDefaults standardUserDefaults] setObject:data1 forKey:cacheKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self displayData:data];
    }];
}

#pragma mark - Private

- (void)displayData:(NSData *)data {
    id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.dataSource = [BrandColor newBrandColorsFromResponse:json];
    [self.tableView reloadData];
    
    self.title = [NSString stringWithFormat:@"%@ BrandColors", @(self.dataSource.count)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"cellId";
    BrandCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BrandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    BrandColor *brandColor = self.dataSource[indexPath.row];
    cell.brandColor = brandColor;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.selected) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    else {
        return;
    }
}

@end
