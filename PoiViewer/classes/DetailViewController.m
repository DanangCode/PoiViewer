//
//  DetailViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize poi;

- (id)init:(NSDictionary *) aPoi{
    self = [super init];
    if (self) {
        [self setPoi:aPoi];
    }
    return self;
}

- (void)loadView {
    [self setTitle:[poi objectForKey:@"name"]];
}


@end
