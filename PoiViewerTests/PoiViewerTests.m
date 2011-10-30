//
//  PoiViewerTests.m
//  PoiViewerTests
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PoiViewerTests.h"
#import "PoiParser.h"

@implementation PoiViewerTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testParser
{
    PoiParser *parser = [[PoiParser alloc] init];
    NSArray *allPois = [parser loadPOIs];
    STAssertNotNil(allPois, @"No Pois Returned");
    
    NSDictionary *poi = [[allPois objectAtIndex:0] objectForKey:@"poi"];
    STAssertNotNil(poi, @"No poi element found");
    STAssertEqualObjects([poi objectForKey:@"name"], @"1 Lombard Street", @"poi name");
    STAssertEqualObjects([poi objectForKey:@"type"], @"Eat", @"poi type");
    [parser release];
    
}

@end
