//
//  ViewController.h
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PoiParser;

@interface PoiViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) PoiParser *parser;
@property(nonatomic, retain) UITableView *tableView;

@end
