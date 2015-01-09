//
//  UIColor+BrandColors.h
//  BrandColors
//
//  Created by dkhamsing on 5/2/14.
//  Copyright (c) 2014 dkhamsing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BC_DEFAULT_COLOR [UIColor clearColor]


/** Category for brand colors. */
@interface UIColor (BrandColors)

/**
 List of brands that have a color.
 @return List of brands.
 */
+ (NSArray*)bc_brands;


/**
 List of brands that have a light color.
 @return List of brands with a light color.
 */
+ (NSArray*)bc_brandsWithLightColor;


/**
 Get color from a brand name.
 Hex colors are from http://brandcolors.net
 @param brand Name of the brand (case insensitive, can ommit symbol).
 @return Color for the brand.
 */
+ (UIColor*)bc_colorForBrand:(NSString*)brand;

@end


/** Class to map brand colors. */
@interface BrandColors : NSObject


@end


/** Brand color class. */
@interface BrandColor : NSObject

/**
 Name of the brand.
 */
@property (nonatomic, strong) NSString *name;


/**
 Color of the brand in hex format.
 */
@property (nonatomic, strong) NSString *hexColor;


/**
 Boolean that specifies if the brand is of light color.
 */
@property (nonatomic) BOOL isLightColor;


@end
