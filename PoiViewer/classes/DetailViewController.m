//
//  DetailViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
@interface DetailViewController()
-(void)addLabel:(NSString *)title position:(int)position;

@end


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
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]];
	[[self view ] setBackgroundColor:[UIColor whiteColor]];
    
   // [self addLabel:[poi objectForKey:@"name"] position:10];
    [self addLabel:[poi objectForKey:@"type"] position:40];
    [self addLabel:[[poi objectForKey:@"address"] objectForKey:@"street"] position:70];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 100, 280, 360)];
    [webView loadHTMLString:[[poi objectForKey:@"review"] objectForKey:@"summary"] baseURL:nil];
    [[self view] addSubview:webView];
    [webView release];

    
    
    
}

-(void)addLabel:(NSString *)title position:(int)position{
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, position, 280, 30)];
    aLabel.text = title;
	aLabel.textAlignment = UITextAlignmentLeft;
    [[self view] addSubview:aLabel];
    [aLabel release];
}

@end
