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

- (void)testLoadParser
{
    PoiParser *parser = [[PoiParser alloc] init];
 
    NSArray *allPois = [parser pois];
    STAssertTrue(([allPois count] > 0), @"No Pois Returned");
    
    NSDictionary *poi = [[allPois objectAtIndex:0] objectForKey:@"poi"];
    STAssertNotNil(poi, @"No poi element found");
    STAssertEqualObjects([poi objectForKey:@"name"], @"1 Lombard Street", @"poi name");
    STAssertEqualObjects([poi objectForKey:@"type"], @"Eat", @"poi type");
    [parser release];
    
}

-(void)testCreateSections {
    PoiParser *parser = [[PoiParser alloc] init];

    STAssertTrue(( [[parser sections] count] > 0), @"No Sections Returned");
    STAssertTrue(( [[[parser sections] objectForKey:@"1"] count] > 0), @"section 1 not filled");
    STAssertTrue(( [[[parser sections] objectForKey:@"1"] count] > 0), @"section 1 not filled");
    

}

@end
