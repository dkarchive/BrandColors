//
//  DemoTests.m
//  DemoTests
//
//  Created by dkhamsing on 5/2/14.
//  Copyright (c) 2014 dkhamsing. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+BrandColors.h"

@interface DemoTests : XCTestCase
@property (nonatomic, strong) UIColor *facebookColor1;
@property (nonatomic, strong) UIColor *facebookColor2;
@end

@implementation DemoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.facebookColor1 = [UIColor bc_colorForBrand:@"facebook"];
    self.facebookColor2 = [UIColor bc_colorForBrand:@"Facebook"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertTrue([self.facebookColor1 isEqual: self.facebookColor2]);
}

@end
