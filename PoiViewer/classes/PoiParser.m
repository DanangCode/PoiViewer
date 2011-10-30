//
//  PoiParser.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PoiParser.h"
//JSON framework https://github.com/stig/json-framework.git
#import "SBJson.h"


@implementation PoiParser
@synthesize pois, sections;

-(id)init {
    self = [super init];
    if (self) {
        [self loadPOIs];
        [self createSections];
    }
    return self;
}


-(void)loadPOIs {
    NSError *error;
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"pois" ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
    if (!jsonString) {
        NSLog(@"Failed to read pois. Error: %@", error);
        [error release];
    }
    //parse the json objects into an array of poi dictionaries
    [self setPois:[jsonString JSONValue]] ;
    
}

-(void) createSections{
    BOOL found;
    
    // Loop through the pois and create our keys
    [self setSections:[[NSMutableDictionary alloc] init]];
    for (NSDictionary *poiNode in [self pois]) {
        
        // we want the content of the node not the node itself
        NSDictionary *poi = [poiNode objectForKey:@"poi"];
        NSString *c = [[poi objectForKey:@"name"] substringToIndex:1];
        
        found = NO;
        
        for (NSString *str in [[self sections] allKeys]) {
            if ([str isEqualToString:c]) {
                found = YES;
            }
        }
        
        if (!found) {
            [[self sections] setValue:[[NSMutableArray alloc] init] forKey:c];
        }
    }
    
    // Loop again and sort the pois into their respective keys
    for (NSDictionary *poiNode in [self pois]) {
        
        // we want the content of the node not the node itself
        NSDictionary *aPoi = [poiNode objectForKey:@"poi"];
        [[[self sections] objectForKey:[[aPoi objectForKey:@"name"] substringToIndex:1]] addObject:aPoi];
    } 
    
  }


- (void)dealloc {
    [sections release];
    [pois release];
    [super dealloc];
}

@end
