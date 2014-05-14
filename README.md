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
```
2014-05-14 12:24:24.397 Demo[65974:60b] BrandColors contains 53 brands:(
    Alibaba,
    Adobe,
    Airbnb,
    Amazon,
    AOL,
    Apple,
    ARM,
    "AT&T",
    "Dish Network",
    Dropbox,
    eBay,
    Evernote,
    Facebook,
    Flipkart,
    Foursquare,
    Foxconn,
    Google,
    HP,
    HTC,
    Huawei,
    IBM,
    Intel,
    LG,
    LinkedIn,
    LINE,
    Microsoft,
    Motorola,
    Netflix,
    Nintendo,
    Nokia,
    NVIDIA,
    PayPal,
    Qualcomm,
    Rovio,
    Samsung,
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
    VSCO,
    WhatsApp,
    Xiaomi,
    "Yahoo!",
    Yelp,
    ZTE
)
```

# TODO
- Add more brands

# Credits
Most colors are from Brand Colors http://brandcolors.net

# Say Hi
- [github.com/dkhamsing](https://github.com/dkhamsing)
- [twitter.com/dkhamsing](https://twitter.com/dkhamsing)
- [contact](http://dkhamsing.tumblr.com/ask)

# License
BrandColors is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
