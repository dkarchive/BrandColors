BrandColors
===========

UIColor Category for over 100 Brand Colors

[![Build Status](https://travis-ci.org/dkhamsing/BrandColors.svg?branch=master)](https://travis-ci.org/dkhamsing/BrandColors)

![](Assets/screenshot.png)

# Installation

## Manual
- Add the files in the BrandColors folder to your project.
- `#import "UIColor+BrandColors.h"`

## Cocoapods
```
platform :ios, '7.0'
pod 'BrandColors'
```

# Usage

## Objective-C
``` objc
UIButton *facebookButton = [[UIButton alloc] init];
facebookButton.backgroundColor = [UIColor bc_colorForBrand:@"Facebook"]; 

NSLog(@"BrandColors contains %@ brands:%@", @([UIColor bc_brands].count),[UIColor bc_brands]);

if ([[UIColor bc_brandsWithLightColor] containsObject:brand]) {
	cell.textLabel.textColor = [UIColor blackColor];    
}
else {
    cell.textLabel.textColor = [UIColor whiteColor];
}
```

If a brand is not in Brand Colors, the default color returned is `[UIColor clearColor]`
```
#define BC_DEFAULT_COLOR [UIColor clearColor]
```

`bc_colorForBrand:` attemps to match brands

``` objc
UIColor *facebookColor;
// facebook or Facebook will work
facebookColor = [UIColor bc_colorForBrand:@"Facebook"]; 
facebookColor = [UIColor bc_colorForBrand:@"facebook"]; 

UIColor *yahooColor;
yahooColor = [UIColor bc_colorForBrand:@"yahoo"]; 
yahooColor = [UIColor bc_colorForBrand:@"Yahoo"]; 
yahooColor = [UIColor bc_colorForBrand:@"Yahoo!"];
```

## Swift
``` swift
var facebookButton = UIButton()
facebookButton.backgroundColor = UIColor.bc_colorForBrand("Facebook")

println("BrandColors contains \(UIColor.bc_brands().count) brands: \(UIColor.bc_brands())")

let lightColorBrands:String[] = UIColor.bc_brandsWithLightColor() as String[]
if ( contains(lightColorBrands,brand) ) {
  cell.textColor = UIColor.blackColor()
}  
else {
  cell.textColor = UIColor.whiteColor()
}
```

# Demo
BrandColors includes two sample projects, one written in Objective-C and one written in Swift.

# List of Brands
``` 
2015-01-09 08:47:24.306 Demo[60174:5216572] BrandColors contains 143 brands:(
    500px,
    "about.me",
    Acer,
    Adobe,
    Airbnb,
    Alibaba,
    Amazon,
    Android,
    AOL,
    Apple,
    ARM,
    Asana,
    "AT&T",
    Atlassian,
    "Barnes & Noble",
    BBC,
    Beats,
    Behance,
    Bing,
    bitly,
    Blizzard,
    Blogger,
    Box,
    Broadcom,
    BT,
    BuzzFeed,
    "China Mobile",
    Cisco,
    Corning,
    Dell,
    "Designer News",
    DirecTV,
    "Dish Network",
    Dribbble,
    Dropbox,
    Dyson,
    eBay,
    Ember,
    Engadget,
    Ericsson,
    Etsy,
    Evernote,
    Expedia,
    Facebook,
    FedEx,
    Firefox,
    Fitbit,
    Flickr,
    Flipboard,
    Flipkart,
    Foursquare,
    Foxconn,
    "General Electric",
    GitHub,
    Google,
    GoPro,
    "Hacker News",
    "Home Depot",
    HP,
    HTC,
    Huawei,
    Hulu,
    IBM,
    iHeartRadio,
    IKEA,
    IMDb,
    Instagram,
    Intel,
    Intuit,
    Jawbone,
    Kickstarter,
    LG,
    LINE,
    LinkedIn,
    Lyft,
    Microsoft,
    Mixpanel,
    Motorola,
    Mozilla,
    Nest,
    Netflix,
    Nintendo,
    Nokia,
    "NTT DoCoMo",
    NVIDIA,
    Opera,
    Panasonic,
    PayPal,
    Philips,
    Pinterest,
    Priceline,
    "Product Hunt",
    Qualcomm,
    Rdio,
    Reddit,
    Redfin,
    Roku,
    Rovio,
    Salesforce,
    Samsung,
    Shazam,
    Skype,
    Snapchat,
    SoftBank,
    SoundCloud,
    Spotify,
    Sprint,
    "Stack Overflow",
    StackOverflow,
    Staples,
    Starbucks,
    Stripe,
    "T-Mobile",
    Tesla,
    TMobile,
    Treehouse,
    Trello,
    Trulia,
    Tumblr,
    Twitch,
    Twitter,
    Uber,
    Ubuntu,
    Verizon,
    Vimeo,
    Vine,
    Visa,
    Vodafone,
    VSCO,
    Walmart,
    WeChat,
    WhatsApp,
    WordPress,
    XBOX,
    Xiaomi,
    Yahoo,
    Yandex,
    Yelp,
    Yo,
    YouTube,
    Zendesk,
    Zillow,
    ZTE
)
```

# Credits
Thanks to [Galen Gidman](https://github.com/galengidman)'s http://brandcolors.net

# Contact
- GitHub: [@dkhamsing](https://github.com/dkhamsing)
- Twitter: [@dkhamsing](https://twitter.com/dkhamsing)
- [Send a Message](http://dkhamsing.tumblr.com/ask)

# License
BrandColors is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
