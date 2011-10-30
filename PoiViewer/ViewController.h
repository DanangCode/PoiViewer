//
//  ViewController.h
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PoiParser;

@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>{
    PoiParser *parser;
}

@property(nonatomic, retain) PoiParser *parser;
@property(nonatomic, retain) UITableView *tableView;

@end
