//
//  ViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PoiParser.h"

@implementation ViewController


@synthesize POIs;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    PoiParser *parser = [[PoiParser alloc] init];
    [self setPOIs:[parser loadPOIs]];
    [parser release];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [POIs release];
    [super dealloc];
}



@end
