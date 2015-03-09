//
//  BrandCell.m
//  BrandColors
//
//  Created by Daniel Khamsing on 3/9/15.
//  Copyright (c) 2015 Daniel Khamsing. All rights reserved.
//

#import "BrandCell.h"
#import "BrandColor.h"

@interface BrandCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *brandLabel;
@property (nonatomic, strong) UIView *colorContent;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *selectedView;
@end

@implementation BrandCell

NSString *cellId2 = @"collectionCellId";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    
    //init
    self.brandLabel = [[UILabel alloc] init];
    self.colorContent = [[UIView alloc] init];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.colorContent.bounds collectionViewLayout:layout];
    self.selectedView = [[UIView alloc] init];
    
    //subviews
    [self.contentView addSubview:self.selectedView];
    [self.contentView addSubview:self.brandLabel];
    [self.contentView addSubview:self.colorContent];
    [self.colorContent addSubview:self.collectionView];
    
    //setup
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.brandLabel.font = [UIFont systemFontOfSize:14];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.scrollsToTop = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId2];
    
    //autolayout
    [@[self.contentView, self.brandLabel, self.colorContent, self.collectionView, self.selectedView] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        obj.translatesAutoresizingMaskIntoConstraints = NO;
    }];
    
    NSDictionary *views = @{
                            @"content":self.contentView,
                            @"brand":self.brandLabel,
                            @"color":self.colorContent,
                            @"collection":self.collectionView,
                            @"selected":self.selectedView,
                            };
    NSDictionary *metrics = @{
                              @"brandWidth":@120,
                              @"brandHeight":@54,
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[content]-|" options:kNilOptions metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[brand(brandWidth)]-[color]-|" options:kNilOptions metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[brand(brandHeight)]-|" options:kNilOptions metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[color]-|" options:kNilOptions metrics:metrics views:views]];
    
    [self.colorContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[collection]-|" options:kNilOptions metrics:metrics views:views]];
    [self.colorContent addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[collection]-|" options:kNilOptions metrics:metrics views:views]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[selected]-|" options:kNilOptions metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[selected]-|" options:kNilOptions metrics:metrics views:views]];
    
    return self;
}

- (void)setBrandColor:(BrandColor *)brandColor {
    _brandColor = brandColor;
    
    self.brandLabel.text = brandColor.name;
    
    self.dataSource = brandColor.uicolors;
    [self.collectionView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (!selected) {
        self.backgroundColor = [UIColor whiteColor];
        self.brandLabel.text = self.brandColor.name;
        self.colorContent.alpha = 1;
    }
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId2 forIndexPath:indexPath];
    cell.layer.cornerRadius = 3;
    
    UIColor *color = self.dataSource[indexPath.row];
    cell.backgroundColor = color;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(36, self.colorContent.frame.size.height - 18);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIColor *color = self.dataSource[indexPath.row];
    
    self.selected = self.selected?NO:YES;
    
    if (self.selected) {
        self.backgroundColor = color;
        self.brandLabel.text = [self hexStringFromColor:color];
        self.colorContent.alpha = 0;
    }
}

#pragma mark - Private

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)].lowercaseString;
}

@end
