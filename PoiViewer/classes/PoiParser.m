//
//  PoiParser.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PoiParser.h"
#import "SBJson.h"
#import "Poi.h"

/*
 The POI parser loads POIs from the pois.json file using the sbJSON framework
 (https://github.com/stig/json-framework.git) It divides them up into an NSMutableDictionary
 called sections by the poi/name in the JSON data. the Key to Sections are the capitalized 
 first letter of the name.*/
@interface PoiParser () 
    -(NSString *)getSectionTitle:(NSString *)name;
    -(BOOL)isNumeric:(NSString *)s;
@end

@implementation PoiParser
@synthesize sections;

-(id)init {
    self = [super init];
    if (self) {
        [self createSections];
    }
    return self;
}

/* Loads the pois.json file and parsed it into an array of Nested NSDictionaries, one for each POI. The Dictionary
 consists of one Key called Poi. That Key contains a Dictioanry with the more relevant keys: name, type, address, review*/
-(NSArray *)loadPOIs {
    NSError *error;
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"pois" ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
    if (!jsonString) {
        NSLog(@"Failed to read pois. Error: %@", error);
        [error release];
    }
    
    //parse the json objects into an array of poi dictionaries using the SBJson library
    
    //NOTE the SBJson parser call to JSONValue is producting a memory leak. The parser does not seem
    //to be cleaning up properly.
    NSArray *poiNodes = [[jsonString JSONValue] autorelease];
    return poiNodes;
    
}

/* Loops throught the pois and divides them into a dictionary of arrays by section Title. There is
 one section Title Key for each capital letter A-Z.*/
-(void) createSections{
    
    NSArray *poiNodes = [self loadPOIs];
    BOOL found;
    // Loop through the pois and create our keys
    [self setSections:[[NSMutableDictionary alloc] init]];
    for (NSDictionary *poiNode in poiNodes) {
        
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
    for (NSDictionary *poiNode in poiNodes) {
        
        // we want the content of the node not the node itself
        Poi *poi = [[Poi alloc] init:[poiNode objectForKey:@"poi"]];
        NSString *title = [self getSectionTitle:[poi name]];
        
        [[[self sections] objectForKey:title] addObject:poi];
    } 
  }

/*takes a string as imput. returns Capitalized first letter of the string. If the string is 
 Numeric, the first letter of the number's word is returned. For example, T (Two) for 2*/
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

/* returns true is the String s is numeric*/
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
    [super dealloc];
}

@end
