//
//  Poi.m
//  PoiViewer
//
//  Created by Greg Ball on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Poi.h"

/* A model representing one POI. This object encapsulates the POI's intenal representation
 from the view code. The poi is a an NSDictionary which mirrors the JSON format found in
 the poi.json file*/
@implementation Poi
@synthesize poi;

-(id)init:(NSDictionary *)aPoi{
    self = [super init];
    if (self) {
        [self setPoi:aPoi];
    }
    return self;
}

-(NSString *)name{
    return [poi objectForKey:@"name"];

}

-(NSMutableString *)shopType{
    NSMutableString *aType = [[[NSMutableString alloc] initWithString:[poi objectForKey:@"type"]] autorelease];
    if ([poi objectForKey:@"subtype"]) {
        [aType appendString:@"/"];
        [aType appendString:[poi objectForKey:@"subtype"]];
    }
    return aType;
}

/* returns a string */
-(NSMutableString *)address{
    NSMutableString *address = [[[NSMutableString alloc] init] autorelease];
    if ([[poi objectForKey:@"address"] objectForKey:@"street"]) {
        [address appendString:[[poi objectForKey:@"address"] objectForKey:@"street"]];
    }
    
    if ([[poi objectForKey:@"address"] objectForKey:@"locality"]) {
        [address appendString:@", "];
        [address appendString:[[poi objectForKey:@"address"] objectForKey:@"locality"]];
    }
    if ([[poi objectForKey:@"address"] objectForKey:@"postcode"]) {
        [address appendString:@", "];
        [address appendString:[[poi objectForKey:@"address"] objectForKey:@"postcode"]];
    }
    return address;
}

-(NSString *)review{
    return [[poi objectForKey:@"review"] objectForKey:@"summary"];
}

@end
