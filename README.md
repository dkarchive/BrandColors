BrandColors
===========

UIColor Category for Brand Colors

![](Assets/screenshot.png)

# Installation
- Add the files in the BrandColors folder to your project.
- `#import "UIColor+BrandColors.h"`

# Usage
``` objc
UIButton *facebookButton = [[UIButton alloc] init];
facebookButton.backgroundColor = [UIColor bc_colorForBrand:@"Facebook"]; 

NSLog(@"BrandColors contains %@ brands:%@", @([UIColor bc_brands].count),[UIColor bc_brands]);
```

If a brand is not in Brand Colors, the default color returned is `[UIColor clearColor]`
```
#define BC_DEFAULT_COLOR [UIColor clearColor]
```

# Demo
BrandColors includes a sample project in the Demo folder.

# List of Brands
```
2014-05-06 09:34:06.453 Demo[99971:60b] BrandColors contains 39 brands:(
    Alibaba,
    Amazon,
    AOL,
    "AT&T",
    Dropbox,
    eBay,
    Facebook,
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
    Nokia,
    PayPal,
    Qualcomm,
    Samsung,
    Snapchat,
    Spotify,
    Sprint,
    Staples,
    "T-Mobile USA",
    Tumblr,
    Twitter,
    Uber,
    Verizon,
    Vimeo,
    Vine,
    Xiaomi,
    "Yahoo!",
    Yelp
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
