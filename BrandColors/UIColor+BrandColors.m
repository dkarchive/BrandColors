//
//  UIColor+BrandColors.m
//  BrandColors
//
//  Created by Daniel on 5/2/14.
//  Copyright (c) 2014 dkhamsing. All rights reserved.
//

#import "UIColor+BrandColors.h"


@implementation BrandColor

+ (BrandColor*)newColorWithName:(NSString*)name hexColor:(NSString*)hexColor isLightColor:(BOOL)isLightColor {
    BrandColor *brandColor = [[BrandColor alloc] init];
    brandColor.name = name;
    brandColor.hexColor = hexColor.lowercaseString;
    brandColor.isLightColor = isLightColor;
    
    return brandColor;
}


+ (BrandColor*)newColorWithName:(NSString*)name hexColor:(NSString*)hexColor {
    return [BrandColor newColorWithName:name hexColor:hexColor isLightColor:NO];
}


@end


@implementation NSMutableDictionary (DK)

- (void)dk_updateKey:(NSString*)key  hexColor:(NSString*)hexColor isLightColor:(BOOL)isLightColor {
    self[key.lowercaseString] = [BrandColor newColorWithName:key hexColor:hexColor isLightColor:isLightColor];
}


- (void)dk_updateKey:(NSString*)key hexColor:(NSString*)hexColor {
    [self dk_updateKey:key hexColor:hexColor isLightColor:NO];
}


@end


@interface BrandColors ()
@property (nonatomic, strong) NSDictionary *colorMap;
@end


@implementation BrandColors

- (id)init {
    self = [super init];
    if (self) {
        [self setupColorMap];
    }
    return self;
}


- (void)setupColorMap {
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    
    [map dk_updateKey:@"Acer" hexColor:@"83b81a"];
    [map dk_updateKey:@"Adobe" hexColor:@"ff0000"];
    [map dk_updateKey:@"Airbnb" hexColor:@"FF5A60"];
    [map dk_updateKey:@"Alibaba" hexColor: @"FF7300"];
    [map dk_updateKey:@"Amazon" hexColor:@"ff9900"];
    [map dk_updateKey:@"Apple" hexColor:@"777777"];
    [map dk_updateKey:@"AOL" hexColor:@"00c4ff"];
    [map dk_updateKey:@"ARM" hexColor:@"0084AB"];
    [map dk_updateKey:@"AT&T" hexColor:@"2D96C8"];
    
    [map dk_updateKey:@"Barnes & Noble"hexColor:@"295A33"];
    [map dk_updateKey:@"BBC"hexColor:@"333333"];
    [map dk_updateKey:@"Beats"hexColor:@"FF0000"];
    [map dk_updateKey:@"Bing"hexColor:@"ffb900"];
    [map dk_updateKey:@"Blizzard"hexColor:@"01B2F1"];
    [map dk_updateKey:@"Box"hexColor:@"00aeef"];
    [map dk_updateKey:@"Broadcom"hexColor:@"E81231"];
    [map dk_updateKey:@"BT"hexColor:@"084897"];
    [map dk_updateKey:@"BuzzFeed"hexColor:@"EE3322"];
    [map dk_updateKey:@"China Mobile"hexColor:@"1d64b8"];
    
    [map dk_updateKey:@"Cisco"hexColor:@"11495E"];
    [map dk_updateKey:@"Corning"hexColor:@"00559B"];
    
    [map dk_updateKey:@"Dell"hexColor:@"0085c3"];
    [map dk_updateKey:@"DirecTV"hexColor:@"0097CD"];
    [map dk_updateKey:@"Dish Network"hexColor:@"DA121D"];
    [map dk_updateKey:@"Dropbox"hexColor:@"007ee5"];
    [map dk_updateKey:@"Dyson"hexColor:@"010101"];
    
    [map dk_updateKey:@"eBay" hexColor:@"e53238"];
    [map dk_updateKey:@"Ericsson"hexColor:@"002561"];
    [map dk_updateKey:@"Evernote"hexColor:@"7ac142"];
    [map dk_updateKey:@"Expedia"hexColor:@"003050"];
    
    [map dk_updateKey:@"Facebook"hexColor:@"3b5998"];
    [map dk_updateKey:@"FedEx"hexColor:@"4D148C"];
    [map dk_updateKey:@"Fitbit"hexColor:@"45C2C5"];
    [map dk_updateKey:@"Flipboard"hexColor:@"C10000"];
    [map dk_updateKey:@"Flipkart"hexColor:@"005387"];
    [map dk_updateKey:@"Foxconn"hexColor:@"1E5AA0"];
    [map dk_updateKey:@"Foursquare"hexColor:@"0cbadf"];
    
    [map dk_updateKey:@"General Electric"hexColor:@"019DDD"];
    [map dk_updateKey:@"Google"hexColor:@"4285f4"];
    [map dk_updateKey:@"GoPro"hexColor:@"009EE2"];
    
    [map dk_updateKey:@"HP"hexColor:@"0096d6"];
    [map dk_updateKey:@"Home Depot"hexColor:@"F86201"];
    [map dk_updateKey:@"HTC"hexColor:@"69B40F"];
    [map dk_updateKey:@"Huawei"hexColor:@"D62D24"];
    
    [map dk_updateKey:@"IBM"hexColor:@"003e6a"];
    [map dk_updateKey:@"iHeartRadio"hexColor:@"BC1C10"];
    [map dk_updateKey:@"Instagram"hexColor:@"3f729b"];
    [map dk_updateKey:@"Intel"hexColor:@"0071c5"];
    
    [map dk_updateKey:@"Jawbone"hexColor:@"1A1A1A"];
    
    [map dk_updateKey:@"LG" hexColor:@"B20E50"];
    [map dk_updateKey:@"LinkedIn"hexColor:@"0e76a8"];
    [map dk_updateKey:@"LINE"hexColor:@"1DCD00"];
    [map dk_updateKey:@"Lyft"hexColor:@"00B4AE"];
    [map dk_updateKey:@"Microsoft"hexColor:@"00a1f1"];
    [map dk_updateKey:@"Motorola"hexColor:@"5C92FA"];
    [map dk_updateKey:@"Mozilla"hexColor:@"C34139"];
    
    [map dk_updateKey:@"Nest"hexColor:@"1EB6DC"];
    [map dk_updateKey:@"Netflix"hexColor:@"b9070a"];
    [map dk_updateKey:@"Nintendo"hexColor:@"8C8C8C"];
    [map dk_updateKey:@"Nokia"hexColor:@"183693"];
    [map dk_updateKey:@"NTT DoCoMo"hexColor:@"CC0033"];
    [map dk_updateKey:@"NVIDIA"hexColor:@"77B900"];
    
    [map dk_updateKey:@"Opera"hexColor:@"cc0f16"];
 
    [map dk_updateKey:@"Panasonic"hexColor:@"0438C2"];
    [map dk_updateKey:@"PayPal"hexColor:@"3b7bbf"];
    [map dk_updateKey:@"Pinterest"hexColor:@"cc2127"];
    [map dk_updateKey:@"Philips"hexColor:@"0A5DD7"];
    [map dk_updateKey:@"Priceline"hexColor:@"0A84C1"];
    [map dk_updateKey:@"Product Hunt"hexColor:@"DA552F"];
    
    [map dk_updateKey:@"Qualcomm"hexColor:@"005daa"];
    
    [map dk_updateKey:@"Reddit"hexColor:@"cee3f8" isLightColor:YES];
    [map dk_updateKey:@"Roku"hexColor:@"662E93"];
    [map dk_updateKey:@"Rovio"hexColor:@"C02227"];
    [map dk_updateKey:@"Rdio"hexColor:@"007dc3"];
    
    [map dk_updateKey:@"Samsung"hexColor:@"0c4da2"];
    [map dk_updateKey:@"Snapchat" hexColor:@"FFFC00" isLightColor:YES];
    [map dk_updateKey:@"Shazam"hexColor:@"1B87E3"];
    [map dk_updateKey:@"Skype"hexColor:@"00aff0"];
    [map dk_updateKey:@"Spotify"hexColor:@"81b71a"];
    [map dk_updateKey:@"Sprint"hexColor:@"fee100"];
    [map dk_updateKey:@"SoftBank"hexColor:@"fbbd09"];
    [map dk_updateKey:@"SoundCloud"hexColor:@"FF8800"];
    [map dk_updateKey:@"Staples"hexColor:@"cc0000"];
    [map dk_updateKey:@"Starbucks"hexColor:@"00704A"];
    
    [map dk_updateKey:@"T-Mobile" hexColor:@"ea0a8e"];
    [map dk_updateKey:@"TMobile" hexColor:@"ea0a8e"];
    [map dk_updateKey:@"Twitch"hexColor:@"6441a5"];
    [map dk_updateKey:@"Twitter"hexColor:@"55acee"];
    [map dk_updateKey:@"Tesla"hexColor:@"CC0000"];
    [map dk_updateKey:@"Tumblr"hexColor:@"34526f"];
    
    [map dk_updateKey:@"Uber"hexColor:@"1CA8C3"];
    
    [map dk_updateKey:@"Verizon"hexColor:@"ef1d1d"];
    [map dk_updateKey:@"Vimeo"hexColor:@"44bbff"];
    [map dk_updateKey:@"Vine"hexColor:@"00a478"];
    [map dk_updateKey:@"Visa"hexColor:@"0157a2"];
    [map dk_updateKey:@"Vodafone"hexColor:@"E90000"];
    [map dk_updateKey:@"VSCO"hexColor:@"AAA94C"];
    
    [map dk_updateKey:@"Walmart"hexColor:@"005CB0"];
    [map dk_updateKey:@"WeChat"hexColor:@"93D034"];
    [map dk_updateKey:@"WhatsApp"hexColor:@"34AF23"];
    [map dk_updateKey:@"WordPress"hexColor:@"464646"];
    
    [map dk_updateKey:@"Xiaomi"hexColor:@"FF4A03"];
    
    [map dk_updateKey:@"Yahoo"hexColor:@"720e9e"];
    [map dk_updateKey:@"Yelp"hexColor:@"c41200"];
    [map dk_updateKey:@"Yo" hexColor:@"9B59B6"];
    [map dk_updateKey:@"YouTube"hexColor:@"e52d27"];
    
    [map dk_updateKey:@"Zillow"hexColor:@"0079E4"];
    [map dk_updateKey:@"ZTE"hexColor:@"0A50A0"];
    
    self.colorMap = map.copy;
}


@end


@implementation UIColor (BrandColors)

#pragma mark - Public

+ (NSArray*)bc_brands {
    return [UIColor dk_listIsLightColor:NO];
}


+ (NSArray*)bc_brandsWithLightColor {
    return [UIColor dk_listIsLightColor:YES];
}


+ (UIColor*)bc_colorForBrand:(NSString*)brand {
    BrandColors *brandColors = [[BrandColors alloc] init];
    BrandColor *bc_object = [brandColors.colorMap objectForKey:brand.lowercaseString];
    
    if (!bc_object) {
        return BC_DEFAULT_COLOR;
    }
    
    return [UIColor dk_colorWithHexString:bc_object.hexColor];
}


#pragma mark - Private

+ (UIColor *)dk_colorWithHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


+ (NSArray*)dk_listIsLightColor:(BOOL)isLightColor {
    
    BrandColors *brandcolors = [[BrandColors alloc] init];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [brandcolors.colorMap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        BrandColor *bc = obj;
        
        if (isLightColor) {
            if (bc.isLightColor) {
                [list addObject:bc.name];
            }
        }
        else {
            
            [list addObject:bc.name];
        }
    }];
    
    return [list.copy sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}


@end
