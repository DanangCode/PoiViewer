//
//  DetailViewController.h
//  PoiViewer
//
//  Created by Greg Ball on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Poi;

@interface DetailViewController : UIViewController

- (id)init:(NSDictionary *) aPoi;
@property(nonatomic, retain) Poi *poi;

@end
