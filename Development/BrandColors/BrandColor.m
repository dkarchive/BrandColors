//
//  BrandColor.m
//  BrandColors
//
//  Created by Daniel Khamsing on 3/9/15.
//  Copyright (c) 2015 Daniel Khamsing. All rights reserved.
//

#import "BrandColor.h"

@implementation BrandColor

+ (NSArray *)newBrandColorsFromResponse:(id)response {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    NSArray *responseObject = (NSArray *)response;
    
    for (NSDictionary *dictionary in responseObject) {
        BrandColor *brandColor = [[BrandColor alloc] init];
        
        brandColor.colorId = dictionary[@"id"];
        brandColor.title = dictionary[@"title"];
        brandColor.colors = dictionary[@"colors"];
        
        [list addObject:brandColor];
    }
    
    return list.copy;
}

- (UIColor *)color {
//    NSString *firstColor = self.colors.firstObject;
//    return [self dk_colorWithHexString:firstColor];
    return self.uicolors.firstObject;
}

- (NSString *)name {
    NSString *name = self.title;
    
    if ([name rangeOfString:@"&#"].location != NSNotFound) {
        name = [name stringByReplacingOccurrencesOfString:@"&#8217;" withString:@"’"];
        name = [name stringByReplacingOccurrencesOfString:@"&#038;" withString:@"&"];
    }
    
    return name;
}

- (NSArray *)uicolors {
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [self.colors enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        UIColor *color = [self dk_colorWithHexString:obj];
        [colors addObject:color];
    }];
    return colors.copy;
}

#pragma mark - Private

- (UIColor *)dk_colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:0];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
