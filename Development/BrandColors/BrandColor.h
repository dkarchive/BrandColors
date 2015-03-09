//
//  BrandColor.h
//  BrandColors
//
//  Created by Daniel Khamsing on 3/9/15.
//  Copyright (c) 2015 Daniel Khamsing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrandColor : NSObject

@property (nonatomic, strong) NSArray *colors;

@property (nonatomic, strong) NSString *colorId;

@property (nonatomic, strong) NSString *title;

+ (NSArray *)newBrandColorsFromResponse:(id)response;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) UIColor *color; //TODO: rename to first color

@property (nonatomic, strong) NSArray *uicolors;

@end
