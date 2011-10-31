//
//  DetailViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Poi.h"

/* Displays a single POI with the poi title type, address and review */
@implementation DetailViewController
@synthesize poi;

- (id)init:(Poi *) aPoi{
    self = [super init];
    if (self) {
        [self setPoi:aPoi];
    }
    return self;
}

- (void)loadView {
    [self setTitle:[poi name]];
    [self setView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]];
	[[self view ] setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
    NSMutableString *category = [[NSMutableString alloc] initWithString:@"Category: "];
    [category  appendString:[poi shopType]];
    aLabel.text = category;
	aLabel.textAlignment = UITextAlignmentLeft;
    [[self view] addSubview:aLabel];
    [aLabel release];
    [category release];

    UILabel *addressLbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 280, 60)];
    NSMutableString *address = [[NSMutableString alloc] initWithString:@"Address: "];
    [address appendString:[poi address]];
    addressLbl.text = address;
	addressLbl.textAlignment = UITextAlignmentLeft;
    [addressLbl setLineBreakMode:UILineBreakModeWordWrap];
    [addressLbl setNumberOfLines:0];
    [[self view] addSubview:addressLbl];
    [addressLbl release];
    [address release];


    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 100, 300, 280)];
    //the default webview shows a gray background when it is scrolled. this code turns it white
    webView.backgroundColor = [UIColor whiteColor];
    for (UIView* subView in [webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            for (UIView* shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:YES];
                }
            }
        }
    }

    [webView loadHTMLString:[poi review] baseURL:nil];
    [[self view] addSubview:webView];
    [webView release];

    
    
    
}


@end
