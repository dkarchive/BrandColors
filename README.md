BrandColors
===========

UIColor Category for Brand Colors

![](Assets/screenshot.png)

# Installation
- Add the files in the BrandColors folder to your project.
- `#import "UIColor+BrandColors.h"`

# Usage
``` 
UIButton *facebookButton = [[UIButton alloc] init];
facebookButton.backgroundColor = [UIColor bc_colorForBrand:@"Facebook"]; 

NSLog(@"BrandColors contains %@ brands:%@", @([UIColor bc_brands].count),[UIColor bc_brands]);

if ([[UIColor bc_brandsWithDarkColor] containsObject:brand]) {
	cell.textLabel.textColor = [UIColor whiteColor];    
}
else {
    cell.textLabel.textColor = [UIColor blackColor];
}
```

If a brand is not in Brand Colors, the default color returned is `[UIColor clearColor]`
```
#define BC_DEFAULT_COLOR [UIColor clearColor]
```

`bc_colorForBrand:` attemps to match brands

``` 
UIColor *facebookColor;
// facebook or Facebook will work
facebookColor = [UIColor bc_colorForBrand:@"Facebook"]; 
facebookColor = [UIColor bc_colorForBrand:@"facebook"]; 

UIColor *yahooColor;
yahooColor = [UIColor bc_colorForBrand:@"yahoo"]; 
yahooColor = [UIColor bc_colorForBrand:@"Yahoo"]; 
yahooColor = [UIColor bc_colorForBrand:@"Yahoo!"]; 
```

# Demo
BrandColors includes a sample project in the Demo folder.

# List of Brands
``` objc
2014-06-10 09:02:47.530 Demo[1676:607] BrandColors contains 71 brands:(
    Acer,
    Alibaba,
    Adobe,
    Airbnb,
    Amazon,
    AOL,
    Apple,
    ARM,
    "AT&T",
    Beats,
    Blizzard,
    Broadcom,
    "China Mobile",
    Cisco,
    Corning,
    "Dish Network",
    Dropbox,
    eBay,
    Evernote,
    Facebook,
    Flipkart,
    Foursquare,
    Foxconn,
    "General Electric",
    Google,
    GoPro,
    HP,
    HTC,
    Huawei,
    IBM,
    Instagram,
    Intel,
    LG,
    LinkedIn,
    LINE,
    Microsoft,
    Motorola,
    Mozilla,
    Netflix,
    Nintendo,
    Nokia,
    "NTT DoCoMo",
    NVIDIA,
    PayPal,
    Qualcomm,
    Rovio,
    Rdio,
    Samsung,
    Shazam,
    Skype,
    Snapchat,
    Spotify,
    Sprint,
    SoftBank,
    Staples,
    "T-Mobile",
    Tumblr,
    Twitter,
    Uber,
    Verizon,
    Vimeo,
    Vine,
    Vodafone,
    VSCO,
    Walmart,
    WhatsApp,
    Xiaomi,
    "Yahoo!",
    Yelp,
    YouTube,
    ZTE
)
```

# Credits
Thanks to [Galen Gidman](https://github.com/galengidman)'s http://brandcolors.net

# Say Hi
- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)
- [contact](http://dkhamsing.tumblr.com/ask)

# License
BrandColors is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
