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

-(NSArray *)loadPOIs {
    NSError *error;
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"pois" ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
    if (!jsonString) {
        NSLog(@"Failed to read pois. Error: %@", error);
        [error release];
    }
    return [jsonString JSONValue];  
}

- (void)dealloc {
    [super dealloc];
}

@end
