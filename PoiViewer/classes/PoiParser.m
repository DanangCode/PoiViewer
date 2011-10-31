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

@interface PoiParser () 
    -(NSString *)getSectionTitle:(NSString *)name;
    -(BOOL)isNumeric:(NSString *)s;
@end

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
    //parse the json objects into an array of poi dictionaries using the SBJson library
    [self setPois:[jsonString JSONValue]] ;
    [jsonString release];
    
}

-(void) createSections{
    BOOL found;
    
    // Loop through the pois and create our keys
    [self setSections:[[NSMutableDictionary alloc] init]];
    for (NSDictionary *poiNode in [self pois]) {
        
        // we want the content of the node not the node itself
        NSDictionary *poi = [poiNode objectForKey:@"poi"];
        NSString *title = [self getSectionTitle:[poi objectForKey:@"name"]];
        
        found = NO;
        for (NSString *str in [[self sections] allKeys]) {
            if ([str isEqualToString:title]) {
                found = YES;
            }
        }
        
        if (!found) {
            [[self sections] setValue:[[NSMutableArray alloc] init] forKey:title];
        }
    }
    
    // Loop again and sort the pois into their respective keys
    for (NSDictionary *poiNode in [self pois]) {
        
        // we want the content of the node not the node itself
        NSDictionary *poi = [poiNode objectForKey:@"poi"];
        NSString *title = [self getSectionTitle:[poi objectForKey:@"name"]];
        [[[self sections] objectForKey:title] addObject:poi];
    } 
  }

-(NSString *)getSectionTitle:(NSString *)name {
    NSString *title = [[name substringToIndex:1] uppercaseString];
    //if numeric return the first letter of the number
    if ([self isNumeric:title]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *myNumber = [f numberFromString:title];
        [f release];
        switch([myNumber intValue]) {
            case 1:
                return @"O";
            case 2:
                return @"T";
            case 3:
                return @"T";
            case 4:
                return @"F";
            case 5:
                return @"F";
            case 6:
                return @"S";
            case 7:
                return @"S";
            case 8:
                return @"E";
            case 9:
                return @"N";
            default:
                return @"Z";
        }
    } else {
        return title;
    }
}

-(BOOL)isNumeric:(NSString *)s
{
    NSScanner *sc = [NSScanner scannerWithString: s];
    if ( [sc scanFloat:NULL] ) {
        return [sc isAtEnd];
    }
    return NO;
}


- (void)dealloc {
    [sections release];
    [pois release];
    [super dealloc];
}

@end
